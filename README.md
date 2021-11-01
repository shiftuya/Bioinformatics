# Задание по биоинформатике

## Часть 1

[Ссылка](https://www.ncbi.nlm.nih.gov/sra/SRX12633924[accn]) на NCBI SRA.

## Часть 2

Запуск пайплайна:
* Скачать `cromwell-XX.jar` [отсюда](https://github.com/broadinstitute/cromwell/releases/latest). (Здесь XX — номер версии)
* Выполнить `java -jar cromwell-XX.jar run hello.wdl`.

В результате должно быть выведено (помимо прочего) следующее (см. файл `hello.txt`):
```
{
    "hello.helloTask.out": "Hello World"
}
```

## Часть 3

Визуализация:
* Скачать `womtool-XX.jar` [отсюда](https://github.com/broadinstitute/cromwell/releases/latest). (Здесь XX — номер версии)
* Выполнить `java -jar womtool-XX.jar graph pipeline.wdl | dot -Tpng > pipeline.png`.

![image](https://github.com/shiftuya/Bioinformatics/blob/master/pipeline.png)

Отличия полученной визуализации от блок-схемы:
* Фаза FastQC изображена отдельно от прочих, поскольку файлы, получаемые на выходе, не используются в других фазах.
* Проверка условия в конце изображена как одна фаза, как и описано в исходном файле.
