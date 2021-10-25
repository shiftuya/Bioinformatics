# Задание по биоинформатике

## Часть 1

[Ссылка](https://www.ncbi.nlm.nih.gov/sra/SRX12633924[accn]) на NCBI SRA.

## Часть 2

Запуск пайплайна:
* Скачать `cromwell-XX.jar` [отсюда](https://github.com/broadinstitute/cromwell/releases/latest). (Здесь XX — номер версии)
* Выполнить `java -jar cromwell-XX.jar run hello.wdl`.

В результате должно быть выведено (помимо прочего) следующее:
```
{
    "hello.helloTask.out": "Hello World"
}
```
