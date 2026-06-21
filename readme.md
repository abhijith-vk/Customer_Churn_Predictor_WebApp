# 📞 Telecom Customer Churn Predictor

An end-to-end machine learning system designed to predict telecom customer churn risk, enabling proactive marketing and retention strategies. The project features a structured modular engineering pipeline alongside a web app deployment containing a **FastAPI** backend and an integrated, interactive **Gradio** web interface.

---

## 🚀 Key Milestones & Project Workflow

1. **Problem Framing**: Defined business targets to catch high-risk churning customers based on historical billing, account, and demographic data.
2. **Exploratory Data Analysis (EDA)**: Conducted comprehensive profiling of the [Kaggle Telco Customer Churn Dataset](https://kaggle.com) inside notebooks to identify early churn indicators.
3. **Data Pipeline Engineering**: Built modular ingestion routines handling missing structures, categorical encodings, and scaling rules.
4. **Experiment Tracking & Tuning**: Managed multiple architectures using **MLflow** to track metrics, systematically selecting and fine-tuning the best model.
5. **Web Implementation**: Implemented a scalable FastAPI serving engine with an interactive Gradio UI mounted directly inside the application root.
6. **Containerization & CI/CD**: Packaged runtime environments using automated Docker blueprints managed by GitHub CI/CD build actions.

---

## 📁 Repository Structure

```text
├── .github/workflows/          # CI/CD pipeline automation definitions
├── notebooks/
│   └── EDA.ipynb               # Initial Exploratory Data Analysis & plotting
├── scripts/
│   ├── prepare_processed_data.py # Orchestrates raw data loading and feature workflows
│   └── run_pipeline.py         # Executes training, tuning, and MLflow logging loops
├── src/                        # Core reusable project production source modules
│   ├── app/
│   │   └── main.py             # FastAPI backend server with mounted Gradio UI
│   ├── data/
│   │   ├── load_data.py        # Automated ingestion logic for dataset assets
│   │   └── preprocess.py       # Handles anomalies, column mapping, and null data
│   ├── features/
│   │   └── build_features.py   # Transformation, vectorization, and feature scaling
│   ├── models/
│   │   ├── train.py            # Model fitting and optimization configurations
│   │   ├── tune.py             # Hyperparameter tuning and metric sweep scripts
│   │   └── evaluate.py         # Computes test metrics and validation matrices
│   └── serving/
│       ├── model/              # Local tracking catalog storing serialized model runs
│       ├── inference.py        # Inference pipeline routing for application data
│       └── utils/
│           ├── utils.py        # Shared runtime environment configurations
│           └── validate_data.py# Incoming schema verification using Pydantic
├── Dockerfile                  # Production container configuration
├── requirements.txt            # Explicit Python environment dependencies
└── README.md
```

---

## 🛠️ Installation & Setup

### Local Prerequisites
Ensure you have Python 3.12+ and Docker installed on your host system.

### 1. Clone & Install Dependencies
```bash
git clone this repo
cd customer-churn-predictor
pip install --upgrade pip
pip install -r requirements.txt
```

### 2. Run the Engineering & Training Pipeline
Clean, engineer, and prepare the dataset splits:
```bash
python scripts/prepare_processed_data.py
```
Execute model training, tuning sweeps, and track experiment logs with MLflow:
```bash
python scripts/run_pipeline.py
```

### 3. Launch the Web Application Locally
Start the integrated FastAPI and Gradio instances directly from the project root directory:
```bash
uvicorn src.app.main:app --reload --port 8000
```
* **Interactive UI**: Open `http://localhost:8000` to interact with sliders and fields using the Gradio layout.
* **REST API Documentation**: Navigate to `http://localhost:8000/docs` to read and test JSON payload endpoint schemas via Swagger UI.

---

### 4. Run with Docker
### Build the Image Locally
```bash
docker build -t {username/path_to_image} .
```

### Run the Container
```bash
docker run -p 8000:8000 {username/path_to_image}
```
The application automatically launches on host port `8000`, serving the prediction endpoints and user forms globally over `0.0.0.0:8000`.

