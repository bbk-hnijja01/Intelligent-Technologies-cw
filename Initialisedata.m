% Load data files
trn1 = importfile('../endoscopy-video-frames-data/1trn.txt', 1, 300);
trn2 = importfile('../endoscopy-video-frames-data/2trn.txt', 1, 300);
trn3 = importfile('../endoscopy-video-frames-data/3trn.txt', 1, 300);
trn4 = importfile('../endoscopy-video-frames-data/4trn.txt', 1, 300);
trn5 = importfile('../endoscopy-video-frames-data/5trn.txt', 1, 300);
trn6 = importfile('../endoscopy-video-frames-data/6trn.txt', 1, 300);
trn7 = importfile('../endoscopy-video-frames-data/7trn.txt', 1, 300);

tst1 = importfile('../endoscopy-video-frames-data/1tst.txt', 1, 3721);
tst2 = importfile('../endoscopy-video-frames-data/2tst.txt', 1, 3721);
tst3 = importfile('../endoscopy-video-frames-data/3tst.txt', 1, 3721);
tst4 = importfile('../endoscopy-video-frames-data/4tst.txt', 1, 3721);
tst5 = importfile('../endoscopy-video-frames-data/5tst.txt', 1, 3721);
tst6 = importfile('../endoscopy-video-frames-data/6tst.txt', 1, 3721);
tst7 = importfile('../endoscopy-video-frames-data/7tst.txt', 1, 3721);

% Normalise data
trn1n = normaliseData(trn1);
trn2n = normaliseData(trn2);
trn3n = normaliseData(trn3);
trn4n = normaliseData(trn4);
trn5n = normaliseData(trn5);
trn6n = normaliseData(trn6);
trn7n = normaliseData(trn7);

tst1n = normaliseData(tst1);
tst2n = normaliseData(tst2);
tst3n = normaliseData(tst3);
tst4n = normaliseData(tst4);
tst5n = normaliseData(tst5);
tst6n = normaliseData(tst6);
tst7n = normaliseData(tst7);
