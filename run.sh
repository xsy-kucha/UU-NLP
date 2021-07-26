#!/usr/bin/env bash
export BERT_BASE_DIR=chinese_L-12_H-768_A-12 #全局变量 下载的预训练bert地址
export MY_DATASET=data #全局变量 数据集所在地址

python run_classifier.py \
  --task_name=sim  \
  --do_train=true \
  --do_eval=true \
  --do_predict=false\
  --data_dir=$MY_DATASET \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=32  \
  --train_batch_size=4 \
  --learning_rate=5e-5 \
  --num_train_epochs=2.0 \
  --output_dir=./sim_output/
