
# Terraform Variable Definition Precedence

When working with Terraform, it's common to define variables in multiple places. However, Terraform uses a specific order of precedence to determine which value takes priority when a variable is defined in more than one place.

Below is a quick reference to help  understand how Terraform chooses which variable value to use, from lowest to highest priority.

## Variable Precedence Order

| Priority | Source                              | Description                                                                 |
|----------|-------------------------------------|-----------------------------------------------------------------------------|
| 1        | **Environment Variables**           | Example: `export TF_VAR_filename="/root/cats.txt"`                         |
| 2        | **terraform.tfvars file**           | Example: `filename = "/root/pets.txt"`                                     |
| 3        | **\*.auto.tfvars files**            | Loaded automatically in alphabetical order                                 |
| 4        | **Command-line flags (-var)**       | Highest precedence, overrides everything else                              |

### Example Breakdown

Suppoese we define the same variable `filename` in multiple places:

1. **Environment Variable**  
   ```bash
   export TF_VAR_filename="/root/cats.txt"
````

2. **terraform.tfvars**

   ```hcl
   filename = "/root/pets.txt"
   ```
3. **variable.auto.tfvars**

   ```hcl
   filename = "/root/mypet.txt"
   ```
4. **Command-line flag**

   ```bash
   terraform apply -var "filename=/root/best-pet.txt"
   ```

In this case, the value that Terraform will actually use is:

```
/root/best-pet.txt
```
Because command-line flags (`-var`) always take the highest precedence.
