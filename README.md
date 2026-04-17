# Hehe Chatbot Project

## 1. Giới thiệu chung
Đây là pipeline xây dựng chatbot phân tích dữ liệu kinh doanh tự động từ ngôn ngữ tự nhiên - hỗ trợ Business Development trong việc phân tích dữ liệu kinh doanh. 
Mã nguồn được viết hoàn toàn trên nền tảng Google Colab và sử dụng Supabase làm cơ sở dữ liệu.

## 2. Cấu trúc thư mục
- `HeheNotebook.ipynb`: File mã nguồn chính (Google Colab Notebook) chứa toàn bộ pipeline.
- `database_schema.sql`: Cấu trúc bảng và các function/trigger (nếu có) dùng trong Supabase.
- folder `data`: Dữ liệu đã được trích xuất từ Supabase để đảm bảo tính tái lập (reproducibility).
- `README.md`: File hướng dẫn cài đặt và chạy.

## 3. Hướng dẫn chạy

Để chạy được project này, vui lòng làm theo các bước sau:

**Bước 1: Chuẩn bị môi trường**
1. Mở Google Colab.
2. Upload file `HeheNotebook.ipynb` lên Google Colab.

**Bước 2: Tái tạo Database**
- Vào SQL Editor của Supabase, chạy nội dung trong file `database_schema.sql` để tạo bảng.
- Giải nén folder `data`
- Upload từng file trong folder `data` vào các bảng vừa tạo để có dữ liệu test.

**Bước 3: Cài đặt Keys / URLs**
Project này yêu cầu kết nối với Supabase và API gpt-4o-mini. 
Vui lòng di chuyển đến ô 'Load data' và ô 'Set-up API Key'.
- `SUPABASE_URL`: [Nhập link Supabase]
- `OPENAI_API_KEY`: [Nhập API Key của bạn]

**Bước 4: Chạy Pipeline**
- Chạy lần lượt từng cell từ trên xuống dưới trong file Notebook.
- Quan sát và đánh giá kết quả

## 4. Dataset
- Database name: Brazilian E-Commerce Public Dataset by Olist
- Đường dẫn: kaggle.com/datasets/olistbr/brazilian-ecommerce
