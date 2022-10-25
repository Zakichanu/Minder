import { Button, TextField } from "@mui/material";
import { FunctionComponent, useEffect } from "react";

import NavBar from "../components/NavBar";
import styles from "./SignupSC.module.css";

const SignupSC: FunctionComponent = () => {
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
        Inscrivez votre centre sportif
      </div>
      <TextField
        className={styles.nameRepresentSCInput}
        sx={{ width: 220 }}
        color="secondary"
        variant="outlined"
        type="text"
        label="Nom représentant"
        placeholder="Nom du représentant"
        size="small"
        margin="none"
        InputProps={{
          className: styles.SCInputMobile,
        }}
        required
      />
      <TextField
        className={styles.fnameRepresentSCInput}
        sx={{ width: 220 }}
        color="secondary"
        variant="outlined"
        type="text"
        label="Prénom représentant"
        placeholder="Prénom du représentant"
        size="small"
        margin="none"
        InputProps={{
          className: styles.SCInputMobile,
        }}
        required
      />
      <TextField
        className={styles.addSCInput}
        sx={{ width: 579 }}
        color="secondary"
        variant="outlined"
        type="text"
        label="Adresse postale CS"
        placeholder="Adresse Centre Sportif"
        size="small"
        margin="none"
        InputProps={{
          className: styles.SCInputMobile,
        }}
        required
      />
      <TextField
        className={styles.citySCInput}
        sx={{ width: 220 }}
        color="secondary"
        variant="outlined"
        type="text"
        label="Ville CS"
        placeholder="Ville du Centre Sportif"
        size="small"
        margin="none"
        InputProps={{
          className: styles.SCInputMobile,
        }}
        required
      />
      <TextField
        className={styles.postalCodeSCInput}
        sx={{ width: 220 }}
        color="secondary"
        variant="outlined"
        type="number"
        label="Code Postal CS"
        placeholder="Code postal du Centre Sportif"
        size="small"
        margin="none"
        InputProps={{
          className: styles.SCInputMobile,
        }}
        required
      />
      <TextField
        className={styles.mailSCInput}
        sx={{ width: 220 }}
        color="secondary"
        variant="outlined"
        type="email"
        label="Mail CS"
        placeholder="Mail du Centre Sportif"
        size="small"
        margin="none"
        InputProps={{
          className: styles.SCInputMobile,
        }}
        required
      />
      <TextField
        className={styles.telSCInput}
        sx={{ width: 220 }}
        color="secondary"
        variant="outlined"
        type="tel"
        label="Téléphone CS"
        placeholder="Téléphone du Centre Sportif"
        size="small"
        margin="none"
        InputProps={{
          className: styles.SCInputMobile,
        }}
        required
      />
      <Button
        className={styles.signupButton}
        sx={{ width: 142 }}
        variant="contained"
        color="secondary"
      >
        Envoyer
      </Button>
      </div>
    </div>
  );
};

export default SignupSC;
