terraform {
  required_providers {
    rabbitmq = {
      source  = "cyrilgdn/rabbitmq" #since terraform does not have an official RabbitMQ provider add this source
      version = "1.1.0"
    }
  }
}

provider "rabbitmq" {
  endpoint = "http://localhost:15672" 
  username = "admin"
  password = "shhhItsASecret"
}



resource "rabbitmq_vhost" "example" {
  name = "my-vhost"
}


resource "rabbitmq_exchange" "prayags-exhange" {
  name       = "prayags-exhange"
  vhost      = rabbitmq_vhost.example.name
  type       = "direct"
  durable    = true
  auto_delete = false
  internal   = false
}

resource "rabbitmq_queue" "money-queue" {
  name       = "my-queue"
  vhost      = rabbitmq_vhost.example.name
  durable    = true
  auto_delete = false
}

resource "rabbitmq_binding" "my" {
  source           = rabbitmq_exchange.prayags-exhange.name
  destination      = rabbitmq_queue.money-queue.name
  destination_type = "queue"
  routing_key      = "my-routing-key"
  vhost            = rabbitmq_vhost.example.name
}
