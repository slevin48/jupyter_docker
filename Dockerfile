FROM python:3.7-slim

ENV APP_HOME /app
WORKDIR ${APP_HOME}

COPY . ./

# Install Ubuntu dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install pip pipenv --upgrade
# RUN pip install -r requirements.txt

# sklearn, numpy, and pandas
RUN pip install scikit-learn numpy pandas

RUN pipenv install --skip-lock --system --dev

CMD ["./scripts/entrypoint.sh"]