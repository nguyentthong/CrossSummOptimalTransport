python -m src.tasks.continual_NCLS.train  \
    -task abs -mode train \
    -temp_dir ./tmp \
    -bert_data_path ./data/bert_data_en2ar/ncls  -dec_dropout 0.2  \
    -model_path ./snap/continual_NCLS_en2ar-en2en  \
    -sep_optim true \
    -lr_bert 0.002  -lr_dec 0.2 \
    -save_checkpoint_steps 5000 \
    -batch_size 1300 \
    -train_steps 400000 \
    -report_every 50 -accum_count 5 \
    -use_bert_emb true -use_interval true \
    -warmup_steps_bert 25000 -warmup_steps_dec 15000 \
    -max_pos 512 -max_length 1000 -max_tgt_len 1000 \
    -log_file ./logs/abs_bert_en2ar \
    -visible_gpus 2 \
    --multi_task \
    --monolingual