# Numerical Methods – Data Analysis Project

**Copyright © Springer Robert Stefan, 2024**

This repository contains implementations of three fundamental numerical 
methods for data analysis and machine learning in **MATLAB/GNU Octave**.

## Contents

- [Method 1: Anomaly Detection](#method-1-anomaly-detection)
- [Method 2: Kernel Regression](#method-2-kernel-regression)
- [Method 3: Text Generation (Markov Chains)](#method-3-text-generation)

---

## Method 1: Anomaly Detection

### Overview

Detects outliers in a dataset using a multivariate Gaussian distribution.  
The method identifies data points that significantly deviate from the norm.

### Mathematical Foundation

- Estimate mean vector `μ` and covariance matrix `Σ`
- Compute probability using:
- f(x) = 1/((2π)^(n/2) * det(Σ)^(1/2)) * exp(-1/2 * (x-μ)^T * Σ^(-1) * (x-μ))
- A data point `x` is an anomaly if `f(x) < ε`

### Algorithm Steps

1. **Parameter Estimation**: Compute `μ` and `Σ`
2. **Threshold Optimization**: Find `ε` that maximizes F1 score
3. **Detection**: Mark all points with `f(x) < ε` as anomalies

### Main Functions

- `estimate_gaussian(X)` – compute `μ` and `σ`
- `gaussian_distribution(X, μ, σ)` – compute probabilities
- `check_predictions(predictions, truths)` – evaluate model
- `optimal_threshold(truths, probabilities)` – select best `ε`

### Usage Example

```matlab
[mu, sigma] = estimate_gaussian(X_train);
prob = gaussian_distribution(X_val, mu, sigma);
[epsilon, F1] = optimal_threshold(y_val, prob);
outliers = find(prob < epsilon);
```

## Method 2: Kernel Regression

### Overview

Performs non-linear regression using kernel functions.  
This supervised learning technique models complex input-output relationships.

### Mathematical Foundation

- Minimizes the regularized cost function:
- J(θ) = Σ(y^(i) - θ^T φ(x^(i)))² + λ||θ||²
- The optimal solution is:
- a = λ(λI + K)^(-1)y
- where K is the Gram matrix constructed using kernel functions.

### Supported Kernel Types

- **Linear Kernel**: `K(x, y) = xᵗy`
- **Polynomial Kernel**: `K(x, y) = (1 + xᵗy)^d`
- **Gaussian (RBF) Kernel**: `K(x, y) = exp(-||x - y||² / (2σ²))`

### Solving Methods

- **Cholesky Decomposition** – Efficient for small/medium datasets
- **Conjugate Gradient** – For large-scale problems

### Main Functions

- `linear_kernel(x, y, other)` – Linear kernel function  
- `polynomial_kernel(x, y, d)` – Polynomial kernel  
- `gaussian_kernel(x, y, sigma)` – RBF kernel  
- `split_dataset(X, y, percentage)` – Splits into training/testing  
- `build_kernel(X, f, f_param)` – Builds Gram matrix  
- `cholesky(A)` – Performs Cholesky decomposition  
- `get_lower_inverse(L)` – Inverts lower-triangular matrix  
- `get_prediction_params(K, y, lambda)` – Solves system via Cholesky  
- `conjugate_gradient(...)` – CG solver  
- `get_prediction_params_iterative(...)` – Uses CG for parameter solving  
- `eval_value(x, X, f, f_param, a)` – Evaluates prediction

### Usage Example

```matlab
[X_train, y_train, X_test, y_test] = split_dataset(X, y, 0.8);
K = build_kernel(X_train, @gaussian_kernel, sigma);
a = get_prediction_params(K, y_train, lambda);
predictions = eval_value(X_test, X_train, @gaussian_kernel, sigma, a);
```

## Method 3: Text Generation using Markov Chains

### Overview

Generates realistic text using **K-order Markov Chains**.  
Learns sequences from training data and generates new text based on learned transitions.

### Mathematical Foundation

- **Markov Assumption**: The next word depends only on the last `K` words  
- **K-Sequences**: Sliding window over the tokenized text  
- **Transition Matrix**: Stores probability of each next word given a K-sequence

### Algorithm Steps

1. **Tokenization** – Break text into words and punctuation
2. **Feature Extraction** – Extract all K-length sequences
3. **Indexing** – Map sequences and words to unique integers
4. **Stochastic Matrix** – Count transitions and normalize
5. **Text Generation** – Sample words based on learned probabilities

### Example (K = 2)

- Text: "I went to the market and to the store"
- K-Sequences: ["I went", "went to", "to the", "the market", "market and", "and to", "to the", "the store"]
- Stochastic Matrix: probabilities for next word given K-sequence

### Main Functions

- `split_input(filePath)` – Tokenizes text from file  
- `punctuation(input)` – Checks if token is punctuation  
- `distinct_words(tokens)` – Extracts unique words  
- `k_secv(tokens, k)` – Creates K-length sequences  
- `distinct_k_secv(sequences)` – Gets unique sequences  
- `word_idx(distinct_words)` – Word → Index map  
- `k_secv_idx(distinct_sequences)` – K-sequence → Index map  
- `stochastic_matrix(...)` – Builds the transition matrix  
- `sample_next_word(...)` – Samples next word based on probabilities  
- `sample_n_words(...)` – Generates a full sentence

### Usage Example

```matlab
tokens = split_input('data/shakespeare.txt');
word_set = distinct_words(tokens);
k_sequences = k_secv(tokens, 2);
k_secv_set = distinct_k_secv(k_sequences);
words_idx = word_idx(word_set);
k_secv_idx = k_secv_idx(k_secv_set);
stoch = stochastic_matrix(k_sequences, tokens, words_idx, k_secv_idx, 2);
generated = sample_n_words("To be", word_set, k_secv_set, 2, stoch, word_set, 10);
```

## Requirements

- MATLAB or GNU Octave
- Linux operating system (for testing)