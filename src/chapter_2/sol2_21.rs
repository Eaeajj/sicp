pub fn solve2_21() {
  let v: Vec<i32> = (0..5).collect();
  let v1 = square_list(&v);
  let v2 = map_square_list(&v);
  println!("{:?}", v1);
  println!("{:?}", v2);
}

fn map_square_list(items: &Vec<i32>) -> Vec<i32> {
  items.iter().map(|x| x * x).collect()
}

fn square_list(items: &Vec<i32>) -> Vec<i32> {
  let mut v = items.to_vec();
  for i in &mut v {
    *i *= *i;
  }
  v
}
