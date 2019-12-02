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

    let result = values.iter().fold(0, |acc, v| acc + calculate_gas_needed_rec(*v, 0));

    println!("{}", result)
}

fn calculate_gas_needed_rec(mass : i32, acc : i32) -> i32{
    if mass > 0 {
        return calculate_gas_needed_rec(calculate_gas_needed(mass), acc + calculate_gas_needed(mass));
    } else {
        return acc;
    }
}

fn calculate_gas_needed( mass: i32) -> i32 {
    let gas : i32 = (mass / 3) - 2;
    if gas > 0 {
        return gas;
    } else {
        return 0;
    }
}
