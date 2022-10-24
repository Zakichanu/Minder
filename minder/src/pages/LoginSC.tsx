import { Button, TextField } from "@mui/material";
import { FunctionComponent, useEffect } from "react";

import NavBar from "../components/NavBar";
import styles from "./LoginSC.module.css";

const LoginSC: FunctionComponent = () => {
  useEffect(() => {
    const scrollAnimElements = document.querySelectorAll(
      "[data-animate-on-scroll]"
    );
    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting || entry.intersectionRatio > 0) {
            const targetElement = entry.target;
            targetElement.classList.add(styles.animate);
            observer.unobserve(targetElement);
          }
        }
      },
      {
        threshold: 0.15,
      }
    );

    for (let i = 0; i < scrollAnimElements.length; i++) {
      observer.observe(scrollAnimElements[i]);
    }

    return () => {
      for (let i = 0; i < scrollAnimElements.length; i++) {
        observer.unobserve(scrollAnimElements[i]);
      }
    };
  }, []);

  return (
    <div className={styles.signupSCDiv} data-animate-on-scroll>
      <NavBar />

      <div className={styles.rectangleDiv}>

      <img
        className={styles.logoPetit1Icon}
        alt=""
        src="../logopetit-1@2x.png"
      />

      <div className={styles.inscrivezVotreCentreSportif}>
        Connectez vous!
      </div>

      <TextField
        className={styles.nameRepresentSCInput}
        color="secondary"
        variant="outlined"
        type="text"
        label="Username"
        placeholder="Username"
        size="small"
        margin="none"
        required
      />
      <TextField
        className={styles.citySCInput}
        color="secondary"
        variant="outlined"
        type="password"
        label="Password"
        placeholder="Password"
        size="small"
        margin="none"
        required
      />
      
      
      <Button
        className={styles.signupButtonConnexion}
        sx={{ width: 142 }}
        variant="contained"
        color="secondary"
      >
        Connexion
      </Button>

      <Button
        className={styles.signupButton}
        sx={{ width: 142 }}
        variant="contained"
        color="secondary"
      >
        Annuler
      </Button>
      </div>
    </div>
  );
};

export default LoginSC;
