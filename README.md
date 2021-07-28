数据集是较小的，只有一万六千多条，格式为csv

验证的结果:

eval_accuracy = 0.81368136

eval_loss = 0.7437524

global_step = 8273

loss = 0.7437464

对于tsv文件，需要将run_classfier.py文件中的SimProcessor类换为：

class SimProcessor(DataProcessor):
    def get_train_examples(self, data_dir):
        file_path = os.path.join(data_dir, 'train.tsv')
        train_df = pd.read_csv(file_path, encoding='utf-8', sep='\t')
        train_data = []
        for index, train in enumerate(train_df.values):
            guid = 'train-%d' % index
            text_a = tokenization.convert_to_unicode(str(train[0]))
            text_b = tokenization.convert_to_unicode(str(train[1]))
            label = str(train[2])
            train_data.append(InputExample(guid=guid, text_a=text_a, text_b=text_b, label=label))
        return train_data
    def get_dev_examples(self, data_dir):
        file_path = os.path.join(data_dir, 'dev.tsv')
        dev_df = pd.read_csv(file_path, encoding='utf-8', sep='\t')
        dev_data = []
        for index, dev in enumerate(dev_df.values):
            guid = 'test-%d' % index
            text_a = tokenization.convert_to_unicode(str(dev[0]))
            text_b = tokenization.convert_to_unicode(str(dev[1]))
            label = str(dev[2])
            dev_data.append(InputExample(guid=guid, text_a=text_a, text_b=text_b, label=label))
        return dev_data

    def get_test_examples(self, data_dir):
        file_path = os.path.join(data_dir, 'test.tsv')
        test_df = pd.read_csv(file_path, encoding='utf-8', sep='\t')
        test_data = []
        for index, test in enumerate(test_df.values):
            guid = 'test-%d' % index
            text_a = tokenization.convert_to_unicode(str(test[0]))
            text_b = tokenization.convert_to_unicode(str(test[1]))
            label = str(test[2])
            test_data.append(InputExample(guid=guid, text_a=text_a, text_b=text_b, label=label))
        return test_data

    def get_sentence_examples(self, questions):
        for index, data in enumerate(questions):
            guid = 'test-%d' % index
            text_a = tokenization.convert_to_unicode(str(data[0]))
            text_b = tokenization.convert_to_unicode(str(data[1]))
            label = str(0)
            yield InputExample(guid=guid, text_a=text_a, text_b=text_b, label=label)

    def get_labels(self):
        return ['0', '1']
