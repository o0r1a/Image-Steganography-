# 📷🔐 Image Steganography using Hyperchaotic and Fibonacci-Based Scrambling with Encryption | MATLAB

> A secure, robust, and high-performance image steganography system built on MATLAB Online.  
> This project combines **hyperchaotic scrambling**, **Fibonacci-based image transformations**, and **encryption** techniques to securely embed and extract secret messages in digital images.

---

## 📌 Table of Contents

- [🌟 Project Highlights](#-project-highlights)
- [📖 Introduction](#-introduction)
- [🚀 Features](#-features)
- [🛠️ Methodology](#️-methodology)
- [📊 Performance Metrics](#-performance-metrics)
- [📂 Project Structure](#-project-structure)
- [📸 Sample Images](#-sample-images)
- [📌 Requirements](#-requirements)
- [🔒 Security Considerations](#-security-considerations)
- [📈 Results](#-results)
- [📚 Future Work](#-future-work)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

---

## 🌟 Project Highlights

- ✅ **Message encryption** before embedding.
- 🔄 **Double-layered scrambling** using:
  - Hyperchaotic systems (e.g., Chen or Lorenz maps)
  - Fibonacci sequence-based pixel permutation
- 🧠 Built entirely in **MATLAB Online**.
- 🖼️ Embeds message in a **scrambled version of the image** for added security.
- 📈 Performance analysis using **PSNR**, **SSIM**, and **BER** metrics.

---

## 📖 Introduction

Image steganography is the technique of hiding secret information within an image in such a way that the presence of the information is imperceptible. This project focuses on strengthening the steganographic process by introducing:

- **Multi-layered scrambling techniques**
- **Encryption of the secret message**
- **Secure message extraction and descrambling**
- **Quantitative performance evaluation**

This ensures both **confidentiality** and **robustness** against attacks or image alterations.

---

## 🚀 Features

- 🔐 Encrypted message embedding
- 🔄 Scrambling using:
  - Hyperchaotic maps (for randomness)
  - Fibonacci sequence (for position permutation)
- 💾 Save and load stego-images
- 🧪 Extract, decrypt, and verify hidden message
- 🧮 Objective performance analysis using:
  - PSNR (Peak Signal-to-Noise Ratio)
  - SSIM (Structural Similarity Index)
  - BER (Bit Error Rate)

---

## 🛠️ Methodology

1. **Input a cover image** (e.g., PNG or JPG)
2. **Scramble** the image using:
   - A **Hyperchaotic map** (to randomize pixel positions)
   - A **Fibonacci permutation** (to reorder matrix indices)
3. **Encrypt** the message using a custom encryption algorithm
4. **Embed** the message using Least Significant Bit (LSB) or custom embedding logic
5. **Generate stego-image**
6. **At the receiver side**:
   - Extract message
   - Decrypt message
   - Descramble image using inverse scrambling
7. **Evaluate** using PSNR, SSIM, BER

---

## 📊 Performance Metrics

| Metric | Description                                | Use                |
|--------|--------------------------------------------|--------------------|
| **PSNR** | Peak error between original and stego-image | Higher = Better    |
| **SSIM** | Structural similarity between two images     | Closer to 1 = Better |
| **BER**  | Bit error in retrieved message               | Lower = Better     |

---

## 📂 Project Structure
Image-Steganography/
│
├── encryption.m # Message encryption logic
├── decryption.m # Message decryption logic
├── hyperchaotic_scramble.m # Hyperchaotic scrambling
├── fibonacci_scramble.m # Fibonacci sequence-based scrambling
├── embed_message.m # Embedding logic
├── extract_message.m # Extraction logic
├── performance_metrics.m # PSNR, SSIM, BER calculations
├── main.m # Execution flow
├── README.md # This file


---

## 📸 Sample Images

![image](https://github.com/user-attachments/assets/e99cb4f6-dc27-4d96-a341-fd3d3409bcbf)


---

## 📌 Requirements

- MATLAB Online or MATLAB Desktop (R2021a+ recommended)
- Image Processing Toolbox (if using advanced operations)
- No additional packages required

---

## 🔒 Security Considerations

- Double scrambling enhances **resistance against statistical attacks**
- Encryption prevents information leak even if message is detected
- Descrambling keys (seed values) are required for correct extraction

---

## 📈 Results

| Image   | PSNR (dB) | SSIM    | BER     |
|---------|-----------|---------|---------|
| Lena    | 49.31     | 0.9987  | 0.0021  |
| Peppers | 48.72     | 0.9974  | 0.0030  |

---

## 📚 Future Work

- Integrate with **GUI** for user-friendly interaction
- Extend to **video steganography**
- Apply **deep learning** for adaptive embedding strength
- Add support for **color image scrambling**

---

## 🤝 Contributing

Pull requests are welcome! If you’d like to contribute new scrambling algorithms or enhance performance analysis tools, feel free to fork this repo and open a PR.

---

## 👤 Author

**Oorja Sharma**  
Connect with me on [LinkedIn](https://www.linkedin.com/in/oorja-sharma-928bb4261?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BPR276jN5SIq8lQXIHyA4Qg%3D%3D)  
Academic Project | 2025  
MATLAB Online Implementation

