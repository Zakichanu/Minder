import { FunctionComponent, useEffect } from "react";

import NavBar from "../components/NavBar";
import styles from "./Homepage.module.css";

const Homepage: FunctionComponent = () => {
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
    <div className={styles.homepageDiv} data-animate-on-scroll>
      <NavBar />
      <img
        className={styles.logoCompletInverse1}
        alt=""
        src="../logo-without-background@2x.png"
        data-animate-on-scroll
      />
      <div
        className={styles.bienvenueSurDiv}
        id="welcome"
        data-animate-on-scroll
      >{`Bienvenue sur `}</div>
      <div
        className={styles.rejoignezNousDiv}
        id="joinus"
        data-animate-on-scroll
      >
        Rejoignez nous
      </div>
      <img
        className={styles.applestoreIcon}
        alt=""
        src="../apple-store-logo@2x.png"
        data-animate-on-scroll
      />
      <img
        className={styles.googleplayIcon}
        alt=""
        src="../google-play-logo@2x.png"
        data-animate-on-scroll
      />
    </div>
  );
};


export default Homepage;
