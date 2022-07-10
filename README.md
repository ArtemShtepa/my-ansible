# Самоконтроль выполненения задания

## 1. Где расположен файл с `some_fact` из второго пункта задания?

Переменная **some_fact** для хоста **localhost** читается из группы **all**, так как данный хост не входит ни в одну другую группу

### **Ответ**: `group_vars/all/examp.yml`

---

## 2. Какая команда нужна для запуска вашего `playbook` на окружении `test.yml`?

Для запуска **playbook** на определённом окружении используется команда `ansible-playbook <playbook> -i <inventory>`, где `<playbook>` - запускаемый **playbook**, а `<inventory>` - файл используемого окружения

### **Ответ**: `ansible-playbook site.yml -i inventory/test.yml`

---

## 3. Какой командой можно зашифровать файл?

Шифрование файла выполняется командой: `ansible-vault encrypt <file> [<file>..]`, где `<file>` - один или несколько файлов, которые нужно зашифровать

### **Ответ**: `ansible-vault encrypt group_vars/deb/examp.yml`

---

## 4. Какой командой можно расшифровать файл?

Расшифровывание файла выполняется командой: `ansible-vault decrypt <file> [<file>..]`, где `<file>` - один или несколько файлов, которые нужно расшифровать

### **Ответ**: `ansible-vault decrypt group_vars/deb/examp.yml`

---

## 5. Можно ли посмотреть содержимое зашифрованного файла без команды расшифровки файла? Если можно, то как?

Шифрованные файлы возможно не только посмотреть, но и редактировать без предварительной расшифровки

Просмотр выполяется командой: `ansible-vault view <file>`, где `<file>` - имя зашифрованного файла

Редактирование выполяется командой: `ansible-vault edit <file>`, где `<file>` - имя зашифрованного файла

### **Ответ**: `ansible-vault view group_vars/deb/examp.yml`

---

## 6. Как выглядит команда запуска `playbook`, если переменные зашифрованы?

Если некоторые файлы или переменные зашифрованы, то для корректной работы **Ansible** необходимо либо указать запрашивать **vault** пароль, либо передать имя файла с паролем

Запрос **vault** пароля: `ansible-playbook <playbook> --ask-vault-password`, где `<playbook>` - исполняемый файл **playbook**, где встречаются зашифрованные данные

Передача пароля через файл: `ansible-playbook <playbook> --vault-password-file <secret>` - где `<playbook>` - исполняемый файл **playbook** с зашифрованными данными, а `<secret>` - файл с паролем

### **Ответ**: `ansible-playbook site.yml --ask-vault-password -i inventory/prod.yml`

---

## 7. Как называется модуль подключения к host на windows?

Список доступных модулей подключения можно посмотреть командой: `ansible-doc -t connection -l`

### **Ответ**: для Windows можно использовать модули подключения `winrm` и `psrp`

---

## 8. Приведите полный текст команды для поиска информации в документации ansible для модуля подключений ssh

Для вывода документации используется команда: `ansible-doc -t <plugin> <module>`, где `<plugin>` - плагин в котором располагается искомая документация, `<module>` - модуль к которому запрашивается документация

### **Ответ**: `ansible-doc -t connection ssh`

---

## 9. Какой параметр из модуля подключения `ssh` необходим для того, чтобы определить пользователя, под которым необходимо совершать подключение?

В соответствии с документацией для определения пользователя при подключении через модуль `ansible.buildin.ssh` (для версии **2.13.1**) используется параметр `remote_user`, который может быть задан:
  - Через интерфейс командной строки ключом `--user`
  - Переменной окружения `ANSIBLE_REMOTE_USER`
  - Ключом `remote_user` в секции `defaults` конфигурационного `ini` файла
  - Ключевым словом ` remote_user`
  - Переменными **Ansible**: `ansible_user`, `ansible_ssh_user`

### **Ответ**: `remote_user`
