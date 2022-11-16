import { FunctionComponent, useEffect } from "react";

import NavBar from "../components/NavBar";
import styles from "./Dashboard.module.css";

const Dashboard: FunctionComponent = () => {
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
    
    <div className={styles.signupSCDiv}>
      <NavBar />
      <div className={styles.ScrollPage}>

        
            <div className={styles.rectangleContent}>
            <img
                className={styles.ImgExit}
                alt = ''
                src = '../cross_exit.png'
              />
              <img
                className={styles.ImgRefresh}
                alt = ''
                src = '../refresh.png'
              />
              <img
                className={styles.ImgActivity}
                alt = ''
                src = '../football.png'
                id ="imgActivity"
              />
              <p id = "nameActivity">activity</p>
              <p id = "horaireActivity">Horaire :</p>
              <p id = "PrixActivity">Prix $/h</p>
            </div>
            
            <div className={styles.rectangleAjout}>
              <img 
              className={styles.logoAjout}
              alt = ''
              src = "../ajout.png"/>
            </div>
            
      </div>

    </div>

  );
};

export default Dashboard;
