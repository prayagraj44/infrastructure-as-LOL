resource "local_file" "Pets-with-var"{
  filename = var.filename
  content = var.file-content-map-string["statemen2"]
}


resource "random_pet" "my-pet-with-var"{
    prefix = var.prefix-list-string[0]
    separator = var.separator
    length = var.length
}

