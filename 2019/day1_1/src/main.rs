use std::convert::TryInto;
use std::str::FromStr;

fn main() {
    let input = include_str!("input.txt");

    let values: Vec<i32> = input
        .trim()
        .split(",")
        .map(|i| i32::from_str(i).unwrap())
        .collect();

    let result = calculate(values, 0);

    println!("{}", result[0]);
}

fn calculate(mut values: Vec<i32>, index: usize) -> Vec<i32> {
    if values[index] == 99 {
        return values;
    }
    let add: i32 = 1;
    let mult: i32 = 2;

    let a: usize = values[index + 1].try_into().unwrap();
    let b: usize = values[index + 2].try_into().unwrap();
    let c: usize = values[index + 3].try_into().unwrap();

    if values[index] == add {
        values[c] = values[a] + values[b]
    } else if values[index] == mult {
        values[c] = values[a] * values[b]
    }

    return calculate(values, index + 4);
}
