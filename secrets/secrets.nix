let
  keys = [
    # /root/.ssh/id_ed25519.pub Normally used for encryption/rekeying
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN05iGDlPn0tsPamw6KnpQVC6kK60qzhbku6brDcxy1w NAS root user"

    # /etc/ssh/ssh_host_ed25519_key.pub The host key, used when bootstrapping 
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIILqoYOGyhN4ndUbeA7BhWbkFqKYkxpCL/vXQsxKafTS"

    # my personal key
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKeVT951W8iXTY0aG0rnRkpA0/40yi2p4utZhYuUnlhY4rxJHonxRBW7WvNAO5nzeo6eHBMSQuS2cLsR3hEV5tkMvaTtJti5h9PG2g/WLEfz08rmL3azoR43ljrYgj5pxsf94JfbI2yR2AGWqtOFqDsInSzGQ1QLBe4zge1mxxNVqKoLPAJmREiF266O2BET8t54ekazkTy34vWkvnRpD1jUtaZ9/A/466AxQCqa1+SYJ9v7NWpNOQ81NAilGuyoVG4ijF4AftIfpksNjogcvX88SA6rPwNVfN+93eOy19L3p5rLL/FMixyKzkKQh7+7XJusvAqTYazI7GUEEpNpukPs7bDI5BuSVd/YYfuDq39P5aUzSDBxOqaTR0J9OT/oXST5D0n2DShN7jsF9z6nGATRcHrvDCR+GTbMxAEYePYfCHgrQe7U0uIzeCHI4jDY4Owvy+MWWEcnQLldyUaRp6XusJ/iN6YgCbLu3UMqupQcoSrAthT3cbbM6gr8vzoURjdSGBi3GvWcAxjsV5m9FOHFpuB7j9UBaYGcS3116kYV+xzjS2OVoR90VOM3d9ml6fYcV6HW7Fmd5Q8pAK/D5UXINnaMTidLOrC5/VgtbIe6ffXWkIR/aY77RJRJS1/HJrJReqiM6KZLecfRS+H2EfHj0ONkBvBuHkg6xDzBA9Qw=="
  ];
in
  {
    "user-andi-hash.age".publicKeys = keys;
    "user-andi-clear.age".publicKeys = keys;
    "user-kaddi-clear.age".publicKeys = keys;
    "postfix-sasl_passwd.age".publicKeys = keys;
  }
