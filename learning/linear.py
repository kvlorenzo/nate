import matplotlib.pyplot as plt
import numpy as np
import tensorflow as tf

import math

import util

def build_model(features, labels, learn_rate=0.1, model_dir=None):
    '''Build a linear classifier.

    @param features: A list of feature names.
    @param labels: A list of label names.
    @param learn_rate: The training rate, defaults to 0.1.
    @param model_dir: A directory to store the model summaries in.

    @return: A 4-tuple of training, testing, plotting, and closing functions.
    '''

    n_in = len(features)
    n_out = len(labels)

    x = tf.placeholder(tf.float32, [None, n_in], name='x')

    with tf.name_scope('linear'):
        W = tf.Variable(
            tf.truncated_normal([n_in, n_out],
                                stddev=1.0 / math.sqrt(float(n_in))),
            name='W')
        b = tf.Variable(tf.zeros([n_out]), name='b')
        util.variable_summaries(W,'W')
        util.variable_summaries(b,'b')
        y = tf.matmul(x, W) + b

    y_ = tf.placeholder(tf.float32, [None, n_out], name='y_')

    with tf.name_scope('cross_entropy'):
        cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_), name='xentropy_mean')
        tf.scalar_summary('cross_entropy', cross_entropy)
    with tf.name_scope('train'):
        global_step = tf.Variable(0, trainable=False)
        learning_rate = tf.train.exponential_decay(learn_rate, global_step,
                                                   100, 0.96, staircase=True)
        # Passing global_step to minimize() will increment it at each step.
        train_step = (
            tf.train.GradientDescentOptimizer(learning_rate)
            .minimize(cross_entropy, global_step=global_step)
        )
        # train_step = tf.train.AdamOptimizer(learn_rate).minimize(cross_entropy)
        # train_step = tf.train.GradientDescentOptimizer(learn_rate).minimize(cross_entropy)

    sess = tf.InteractiveSession()
    merged = tf.merge_all_summaries()
    summary_writer = tf.train.SummaryWriter(model_dir, sess.graph)

    if n_out >= 2:
        correct_prediction = tf.equal(tf.argmax(tf.nn.softmax(y),1), tf.argmax(y_,1))
    else:
        correct_prediction = tf.equal(tf.sign(y), y_)
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))

    # yb = tf.one_hot(tf.argmax(y,1), n_out, on_value=True, off_value=False, dtype=tf.bool)
    # y_b = tf.one_hot(tf.argmax(y_,1), n_out, on_value=True, off_value=False, dtype=tf.bool)
    # yb = tf.argmax(y,1)
    # y_b = tf.argmax(y_,1)
    # precision, precision_op = tf.contrib.metrics.streaming_precision(yb, y_b)
    # recall, recall_op = tf.contrib.metrics.streaming_recall(yb, y_b)

    ## NOTE: must be last!!
    tf.initialize_all_variables().run()

    k = tf.placeholder(tf.int32, [], name='k')
    top_k = tf.nn.top_k(tf.transpose(tf.nn.softmax(y)), k)

    def train(data, i, validation=None, verbose=False):
        summary_str, _ = sess.run([merged, train_step],
                                  feed_dict={x: data[features], y_: data[labels]})
        if i % 100 == 0:
            summary_writer.add_summary(summary_str, i)
        if validation is not None:
            # acc = sess.run(accuracy,
            #                feed_dict={x: validation[features], y_: validation[labels]})
            if verbose and i % 100 == 0:
                acc = 0
                acc1 = 0
                for val in validation:
                    ys, (top_values, top_indices) = sess.run([tf.nn.softmax(y), top_k], feed_dict={x: val[features], y_:val[labels], k:min(3, len(val))})
                    # print ys
                    #top_k = np.argpartition(ys, 3, 0)
                    # print top_indices
                    if any(val['L-DidChange'][idx] == 1 for idx in top_indices[1]):
                        acc += 1
                    if val['L-DidChange'][top_indices[1][0]] == 1:
                        acc1 += 1
                acc = float(acc) / len(validation)
                acc1 = float(acc1) / len(validation)
                print('accuracy at step %4d: %.3f / %.3f' % (i, acc1, acc))


    def test(data):
        acc = 0
        acc1 = 0
        acc2 = 0
        for d in data:
            ys, (top_values, top_indices) = sess.run([tf.nn.softmax(y), top_k], feed_dict={x: d[features], y_:d[labels], k:min(3, len(d))})
            # print ys
            #top_k = np.argpartition(ys, 3, 0)
            # print top_indices
            if any(d['L-DidChange'][idx] == 1 for idx in top_indices[1]):
                acc += 1
            if d['L-DidChange'][top_indices[1][0]] == 1:
                acc1 += 1
            if d['L-DidChange'][top_indices[1][0]] == 1 or d['L-DidChange'][top_indices[1][1]] == 1:
                acc2 += 1

        acc = float(acc) / len(data)
        acc1 = float(acc1) / len(data)
        acc2 = float(acc2) / len(data)
        print('accuracy: %.3f / %.3f / %.3f' % (acc1, acc2, acc))
        # acc, truth, observed, raw_max, raw = sess.run(
        #     [accuracy, tf.argmax(tf.nn.softmax(y),1), tf.argmax(y_,1), tf.nn.softmax(y), y],
        #     {x: data[features], y_: data[labels]})
        # print raw_max[0]
        # print raw[0]
        # # True positives.
        # tp = np.sum(np.logical_and(truth, observed))
        # # False positives.
        # fp = np.sum(np.logical_and(np.logical_not(truth), observed))
        # # False negatives.
        # fn = np.sum(np.logical_and(truth, np.logical_not(observed)))
        # # True negatives.
        # tn = np.sum(np.logical_and(np.logical_not(truth), np.logical_not(observed)))
        # precision = np.float32(tp) / (tp + fp)
        # recall = np.float32(tp) / (tp + fn)
        # fscore = 2.0 * precision * recall / (precision + recall)
        # print('accuracy: %f' % acc)
        # print('precision: %f' % precision)
        # print('recall: %f' % recall)
        # print('f1 score: %f' % fscore)

    def plot():
        w = sess.run(tf.transpose(W))
        plt.matshow(w, cmap='hot', interpolation='nearest')
        plt.xticks(np.arange(len(features)), features, rotation=90)
        plt.yticks(np.arange(len(labels)), labels)
        # plt.legend()
        plt.show()

    def close():
        sess.close()
        tf.reset_default_graph()

    return train, test, plot, close
