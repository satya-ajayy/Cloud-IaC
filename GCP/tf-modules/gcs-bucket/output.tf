/* Output Variables for GCS Bucket */

output "bucket_name" {
  value = google_storage_bucket.bucket.name
}
