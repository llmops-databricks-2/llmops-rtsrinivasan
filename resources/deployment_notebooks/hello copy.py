# Databricks notebook source
# ruff: noqa: ERA001
# Databricks MAGIC comments are executable notebook cells.
"""Check the deployed wheel, configuration and schema write access."""

# MAGIC %md
# MAGIC # Hello
# MAGIC
# MAGIC The first job of your course repo. It proves three things on the first deploy: your
# MAGIC `arxiv_curator` wheel installs on serverless, `project_config.yml` loads, and you can
# MAGIC write to your own schema. It appends one row to the table `hello` there.

# COMMAND ----------

from datetime import UTC, datetime

from databricks.sdk.runtime import dbutils
from pyspark.sql import SparkSession

from arxiv_curator.config import load_config


print(f"Wrote one row to")
