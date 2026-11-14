from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(title="DevOps Demo App")

# 定义埋点，生成metrics
Instrumentator().instrument(app).expose(app)

@app.get("/")
def hello():
    return {"msg": "hello devops lab"}

@app.get("/health")
def health():
    return {"status": "ok"}