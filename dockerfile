# 锁定 Python 3.12.3 slim 基础镜像
FROM python:3.12.3-slim

WORKDIR /app

# 不生成 pyc、日志实时输出，适合容器环境
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 先装依赖（利用 Docker 层缓存）
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# 再拷贝业务代码
COPY app/main.py ./main.py

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

