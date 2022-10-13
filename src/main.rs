extern crate num;
use num::integer::gcd;

struct Rat {
    nom: i32,
    den: i32,
}


impl Rat {
    fn new(nom: i32, den: i32 ) -> Rat {
        let d = gcd(nom, den);
        Rat { nom: nom / d, den: den / d }
    }
    
    fn print(&self) -> &Rat {
        println!("{0}/{1}", self.nom, self.den);
        &self
    }

    fn add(&self, rat: Rat) -> Rat {
        let nom = self.nom * rat.den + self.den * rat.nom;
        let den = self.den * rat.den;
        Rat::new(nom, den)
    }

    fn sub(&self, rat: Rat) -> Rat {
        let nom = self.nom * rat.den - self.den * rat.nom;
        let den = self.den * rat.den;
        Rat::new(nom, den)
    }

    fn mul(&self, rat: Rat) -> Rat {
        let nom = self.nom * rat.nom;
        let den = self.den * rat.den;
        Rat::new(nom, den)
    }
    
    fn div(&self, rat: Rat) -> Rat {
        let nom = self.nom * rat.den;
        let den = self.den * rat.nom;
        Rat::new(nom, den)
    }
}

fn main() {
    println!("Hello, world!");
    Rat::new(2, 5).print()
        .add(Rat::new(2, 5)).print()
        .mul(Rat::new(1, 2)).print()
        .div(Rat::new(20, 50)).print()
        .sub(Rat::new(1, 20)).print();
}
