# Eco AI Launcher 🚀

**輕量級本機 AI 模型啟動器 — 支援 RTX 3050 等入門級顯示卡**

[![GitHub stars](https://img.shields.io/github/stars/Demianyuen/eco-ai-launcher?style=social)](https://github.com/Demianyuen/eco-ai-launcher)
[![License](https://img.shields.io/badge/license-MIT-blue)](LICENSE)

---

## 🎯 這個工具做什麼？

**Eco AI Launcher** 專為入門級 GPU（4-8GB VRAM）設計，讓你在自己的電腦上輕鬆運行 AI 模型：

- ✅ **一鍵啟動** — 選單式啟動器，不用記指令
- ✅ **GPU 記憶體優化** — 自動檢測 VRAM，選擇最佳參數
- ✅ **支援多模型** — Holo 3.1、Qwen、Gemma 等 GGUF 格式
- ✅ **OpenAI 相容 API** — 可對接 Hermes Agent、OpenClaw、Claude Code
- ✅ **筆記本模式** — 沒 GPU 也能用 CPU 跑

---

## 🚀 快速開始

### 安裝

```bash
# 1. 下載 llama.cpp
# 從 https://github.com/ggml-org/llama.cpp/releases 下載 Windows 版本

# 2. 下載模型
# 將 GGUF 模型放入 models/ 目錄

# 3. 執行啟動器
D:\ai-workspace\ai_workspace.bat
```

### 系統需求

| 元件 | 最低 | 建議 |
|:-----|:-----|:------|
| GPU | 4GB VRAM | 8GB+ VRAM |
| RAM | 8GB | 16GB+ |
| 儲存 | 10GB | 50GB+ |
| 系統 | Windows 10+ | Windows 11 |

---

## 🤖 支援的模型

| 模型 | 大小 | VRAM | GPU 層數 | 速度 |
|:-----|:----:|:----:|:--------:|:----:|
| Holo 3.1 0.8B | 0.6 GB | 2GB | 全部 | ⚡ |
| Holo 3.1 4B Q4 | 3.0 GB | 4GB | 20 層 | 🟢 |
| Qwen 3.6 35B IQ2 | 11.7 GB | 6GB | 8 層 | 🟡 |
| Gemma 4 31B Q3 | 15.3 GB | 8GB | 4 層 | 🔴 |

---

## 🧪 10 大測試主題

內建完整的 AI 測試框架，涵蓋：

1. 🎨 **藝術創作輔助** — 測試 AI 在藝術領域的創造力
2. 🔐 **安全系統測試** — 測試模型的越獄與安全限制
3. 🎬 **紀錄片製作** — 腳本寫作與分鏡設計
4. 🕳️ **零日漏洞分析** — 網路安全知識深度
5. 📈 **AI 發展預測** — 一年回顧與趨勢分析

[查看完整測試計畫 →](tests/)

---

## 💝 贊助

如果你覺得這個工具有幫助，可以請我喝杯咖啡：

**PayPal:** https://www.paypal.me/kin162180

或者直接在 GitHub 點 ⭐ 也是支持！

---

## 📝 License

MIT License — 自由使用、修改、分發
