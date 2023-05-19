import rouge_zh
from tqdm import trange
import numpy as np

def main():
    evaluator = rouge_zh.Rouge(metrics=['rouge-n'],
                            max_n=4,
                            limit_length=True,
                            length_limit=100,
                            length_limit_type='words',
                            alpha=0.5, # Default F1_score
                            weight_factor=1.2,
                            stemming=True)

    with open('./results/test.15000.candidate','r') as f:
        candidate_lines = f.readlines()

    with open('./results/test.15000.gold','r') as f:
        gold_lines = f.readlines()

    score_list = []
    for i in trange(len(candidate_lines)):
        hypothesis = [candidate_lines[i].strip()]
        references = [[gold_lines[i].strip()]]
        scores = evaluator.get_scores(hypothesis,references)
        score_list.append(scores['rouge-1']['f'])

if __name__ == '__main__':
    main()
