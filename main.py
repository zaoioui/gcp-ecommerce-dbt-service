from fastapi import FastAPI
import subprocess
import uvicorn

app = FastAPI()

@app.get("/")
def home():
    return {"message": "DBT service is running"}

@app.get("/run-dbt")
def run_dbt():
    result = subprocess.run(
        ["dbt", "run", "--project-dir", "/app/ecommerce_dbt", "--profiles-dir", "/root/.dbt"],
        capture_output=True,
        text=True
    )
    return {
        "returncode": result.returncode,
        "stdout": result.stdout,
        "stderr": result.stderr
    }

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8080)