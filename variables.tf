variable "filename"{
    default = "./test-files/petssssss.txt"
    type = string
    description = "the for the local file to be created"
}

variable "content"{
    default = "My fav pet is Kalliii and buzo"
    #type and description are optional
}


###### any/default/blank ######
variable "prefix"{
    default = "Mrs."
    type = any # any is deafult
}


###### number ######

variable "separator"{
    default = "."
    #here no type that mean defaults to 'any'
}


variable "length"{
    default = 2
    type = number
    description = "length of the name"
}


###### Boolean ######
variable "password_change"{
    default = true
    type = bool
}


###### list ######
variable "prefix-list" {
    default = ["Mr", "Mrs", "Sir"]
    type =  list 
}


variable "prefix-list-string" {
    default = ["Mr", "Mrs", "Sir"]
    type =  list(string)
}

variable "prefix-list-number" {
    default = [1, 2, 3]
    type =  list(number)
}



###### map ######
variable "file-content-map" {
  type = map
  default = {
     "statemen1" = "We love pets"
     "statemen2" = "We love animals"
  }
}

variable "file-content-map-string" {
  type = map(string)
  default = {
     "statemen1" = "We love pets"
     "statemen2" = "We love animals"
  }
}

variable "file-content-map-number" {
  type = map(number)
  default = {
     "dog" = 1
     "cat" = 3
     "cow" = 7
  }
}


###### Sets ######
variable "prefix-sets-string" {
    default = ["Mr","Mrs","Sir"]
    type = set(string) #cannot have dupes
}

variable "prefix-sets-number" {
    default = [10, 20, 50]
    type = set(number) #cannot have dupes
  
}

###### Object ######
variable "kalli" {
    type = object({
      name =  string
      color = string
      age = number
      food = list(string)
      favorite_pet = bool
    })

    default = {
      name = "kalli"
      color = "black"
      age = "6"
      food = ["fish", "chiecken", "bisucuts"]
      favorite_pet = true
    }
}



###### Tuples ######

variable kitty {
    type = tuple([ string, number, bool ])
    default = [ "dog", 0, false ]
  
}