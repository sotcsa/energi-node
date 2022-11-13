#!/usr/bin/env python3

import os
import sys
import re
import boto3


def fetch_s3_files(bucket, folder):
    s3_client = boto3.resource('s3')
    s3_bucket = s3_client.Bucket(bucket)
    sorted_files = []
    for i in s3_bucket.objects.filter(Prefix=folder).all():
        object_key = i.key
        if re.match(".*\.zip$", object_key):
            path_parts = object_key.split(os.sep)
            file = path_parts[len(path_parts) - 1]
            sorted_files.append(file.lower())
    sorted_files.sort()
    for file_name in sorted_files:
        print(file_name)


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: aws-s3-ls-only-files.bash {bucket} {folder}")
        exit(1)

    fetch_s3_files(sys.argv[1], sys.argv[2])
