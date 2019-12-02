use std::io::{BufReader, BufRead};
use std::fs::File;

fn main() {

    let f = File::open("values.txt");
    let reader = BufReader::new(f.unwrap());
    let mut values : Vec<i32> = Vec::new();

    for line in reader.lines() {
        match line {
            Ok(line) => values.push(line.parse().unwrap()),
            Err(_) => println!("Error reading file"),
        }
    }

    let result = values.iter().fold(0, |acc, v| acc + ((v / 3) - 2));

    println!("{}", result)
}
