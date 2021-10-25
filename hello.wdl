workflow hello {
    call helloTask
}

task helloTask {
    command {
        echo "Hello World"
    }
    
    output {
        String out = read_string(stdout())
    }
}
