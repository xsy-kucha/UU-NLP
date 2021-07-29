export BERT_BASE_DIR=/content/drive/MyDrive/chinese_L-12_H-768_A-12
export GLUE_DIR=/content/drive/MyDrive/lcqmc/lcqmc

python run_classifier.py \
  --task_name=sim \
  --do_train=true \
  --do_eval=true \
  --do_predict=true \
  --data_dir=$GLUE_DIR \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
  --max_seq_length=32 \
  --train_batch_size=4 \
  --learning_rate=2e-5 \
  --num_train_epochs=2.0 \
  --output_dir=/tmp/mrpc_output/
