resource "local_file" "Pets-with-var"{
  filename = var.filename
  content = var.content
}


resource "random_pet" "my-pet-with-var"{
    prefix = var.prefix
    separator = var.separator
    length = var.length
}