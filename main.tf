resource "local_file" "Petss"{
  filename = "./test-files/petss.txt"
  content = "I love dogs!"	
}

resource "local_file" "DOGS"{
  filename = "./test-files/doggs.txt"
  content = "I love dogs!"	
}

resource "random_pet" "my-pet"{
    prefix = "Mrs"
    separator = "."
    length = "1"

}