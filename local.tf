resource "local_file" "Pet"{
  filename = "./test-files/pets.txt"
  content = "I love dogs!"	
}
