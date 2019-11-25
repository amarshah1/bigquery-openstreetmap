#!/bin/bash
gcloud pubsub topics create $PS_TOPIC_DF --project $GCP_PROJECT
gcloud pubsub topics create $PS_TOPIC_LAYERS  --project $GCP_PROJECT
gsutil mb $GCS_BUCKET
gsutil mb $GCS_GEOJSON_BUCKET

bq mk --project_id $GCP_PROJECT $BQ_SOURCE_DATASET
bq mk --project_id $GCP_PROJECT $BQ_TEMP_DATASET
bq mk --project_id $GCP_PROJECT $BQ_TARGET_DATASET

gsutil -m cp -r cf_init_df/df_template $GCS_BUCKET/

gsutil -m cp -r ../layered_gis $GCS_BUCKET/
