{ config, pkgs, ... }:

{
  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDKeVT951W8iXTY0aG0rnRkpA0/40yi2p4utZhYuUnlhY4rxJHonxRBW7WvNAO5nzeo6eHBMSQuS2cLsR3hEV5tkMvaTtJti5h9PG2g/WLEfz08rmL3azoR43ljrYgj5pxsf94JfbI2yR2AGWqtOFqDsInSzGQ1QLBe4zge1mxxNVqKoLPAJmREiF266O2BET8t54ekazkTy34vWkvnRpD1jUtaZ9/A/466AxQCqa1+SYJ9v7NWpNOQ81NAilGuyoVG4ijF4AftIfpksNjogcvX88SA6rPwNVfN+93eOy19L3p5rLL/FMixyKzkKQh7+7XJusvAqTYazI7GUEEpNpukPs7bDI5BuSVd/YYfuDq39P5aUzSDBxOqaTR0J9OT/oXST5D0n2DShN7jsF9z6nGATRcHrvDCR+GTbMxAEYePYfCHgrQe7U0uIzeCHI4jDY4Owvy+MWWEcnQLldyUaRp6XusJ/iN6YgCbLu3UMqupQcoSrAthT3cbbM6gr8vzoURjdSGBi3GvWcAxjsV5m9FOHFpuB7j9UBaYGcS3116kYV+xzjS2OVoR90VOM3d9ml6fYcV6HW7Fmd5Q8pAK/D5UXINnaMTidLOrC5/VgtbIe6ffXWkIR/aY77RJRJS1/HJrJReqiM6KZLecfRS+H2EfHj0ONkBvBuHkg6xDzBA9Qw== /home/andi/.ssh/id_rsa"
    ];

    shell = pkgs.fish;
  };
}
