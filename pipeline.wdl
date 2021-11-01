
task fastqcTask {

    File fastq
    
    
    String outputFilename = sub(fastq, "\\.fastq.gz", "_fastqc.html")


    command {
        fastqc ${fastq} -o .
    }
    
    output {
        File report = outputFilename
    }
}

task indexTask {
    File reference
    File fastq
    
    command {
        bwa index ${reference}
        bwa mem ${reference} ${fastq} > output.sam
    }
    
    output {
        File sam = "output.sam"
    }
}

task flagstatPercentage {
    File flagstat
    
    command {
        grep -o -P '[0-9]*(\.[0-9]*)?(?=%)' ${flagstat}
    }
    
    output {
        String percentage = read_string(stdout())
    }
}

task samtoolsTask {
    File sam
    
    command {
        samtools flagstat ${sam} > flagstat.txt
    }
    
    output {
        File flagstat = "flagstat.txt"
    }
}

task checkResult {
    String percentage
    
    command {
        if (( $(echo "${percentage}>90" | bc -l) )); then
          echo "OK"
        else
          echo "Not OK" 
        fi
    }
    
    output {
        String result = read_string(stdout())
    }
}

workflow hello {

    File fastqFile
    
    File referenceFile

    call fastqcTask { input: fastq=fastqFile }
    
    call indexTask { input: reference=referenceFile, fastq=fastqFile }
    
    call samtoolsTask { input: sam=indexTask.sam }
    
    call flagstatPercentage { input: flagstat=samtoolsTask.flagstat }
    
    call checkResult { input: percentage=flagstatPercentage.percentage }
  

}







