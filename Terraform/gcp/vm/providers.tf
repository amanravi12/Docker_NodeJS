# Specify the provider (GCP, AWS, Azure)
provider "google" {
credentials = "${file("C:/Users/aman.json")}"
project = "rosy-crawler-362009"
region = "us-central1"
}