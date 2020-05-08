FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/
COPY ./model_data/boston_housing_prediction.joblib /app/model_data/
COPY requirements.txt /app/

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install pip==20.0.2 && \
    pip install --trusted-host pypi.python.org -r requirements.txt

## Step 4:
# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]