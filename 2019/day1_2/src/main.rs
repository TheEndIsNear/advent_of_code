use std::convert::TryInto;
use std::str::FromStr;

fn main() {
    let input = include_str!("input.txt");

    let values: Vec<i32> = input
        .trim()
        .split(",")
        .map(|i| i32::from_str(i).unwrap())
        .collect();

    let mut noun = 0;
    let mut verb = 0;

    loop {
        let mut test_input = values.clone();
        test_input[1] = noun;
        test_input[2] = verb;

        let result = calculate(test_input, 0);

        if result[0] == 19690720 {
            break;
        } else if noun < 99 {
            noun = noun + 1;
        } else {
            noun = 0;
            verb = verb + 1;
        }
    }

    let result = 100 * noun + verb;
    println!("{}", result)
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
