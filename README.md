# Face Recognition with LBP
this code uses LBP and KNN to do face recognition.

# Details
1. Local patch  
    * P = 8, R = 1
2. mapped patterns  
    * according to the `0-1`/`1-0` hop counts to map the initial 256 patterns to 58 uniform and 1 non-uniform patterns.
3. classification  
    * use `KNN` (try different `k`) method to do classification.
    * use `Histogram intersection` to evaluate the `distance` of two LBP descriptors.

# Run
1. make sure the input images' path is right.  
    * in this dir, image path is `CroppedYale/` + `path in recognition_*.txt`.
2. `train.m` extracts train images' LBP descriptors.
    * save them in a file.
3. run `run.m`  
    * the acc will be given.
    * this code takes quite a long time to do face recognition.

# Result
in test set:

k   | acc
--- | ---
50  | 0.9641
15  | 0.9716
5   | 0.9679
1   | 0.9868

choose `k = 1`.
