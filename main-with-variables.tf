resource "local_file" "Pets-with-var"{
  filename = var.filename
  content = var.file-content-map-string["statemen2"]
}


resource "random_pet" "my-pet-with-var"{
    prefix = var.prefix-list-string[0]
    separator = var.separator
    length = var.length
}

resource "local_file" "Pets-with-reference-implicit"{
  filename = var.filename-for-pet-with-ref
  content = "My fav pet is ${random_pet.my-pet-with-var.id}" #referenced to above resource
  # above is implicit dependency tf figures out itself what to delete or create first that is order
}

resource "local_file" "Pets-with-reference-explicit"{
  filename = var.filename-for-pet-with-ref
  content = "My fav pet is Mrs. Kalli" 
  # above is explicit dependency we tell tf that we are dependent on some resource
  #Explicitly specifying dependency is only necessary when a resource relies on some other resource indirectly,
  #and it does not make use of a reference expression as seen in this case.
}


output pet-name {

  value = random_pet.my-pet-with-var.id
  description = "optional value can give any desc"
  
}