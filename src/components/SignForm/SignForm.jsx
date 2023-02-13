import { useState } from "react";
import styles from "./SignForm.module.css";




export default function SignForm() {

    const[user, setUser] = useState({
        name:"",
        email:"",
        password:""
    })

    const handleChange = (e) =>{
        setUser({...user, [e.target.name]: e.target.value})     //spread user pour ne pas perdre autres données lors de update
    }

    const handleSubmit = async(e) =>{
        e.preventDefault();
        await fetch('/api/createUser',{method: "POST", body: {}})
        setUser({name: "", email:"", password:""})              //equivalent de input.value="" après enregistrer formulaire
    }

    return (
      <form className={styles.form} action="/api/createUser" method="post">
        <input type="text" name="name" placeholder="Pseudo" value={user.name} onChange={handleChange} />
        <input type="email" name="email" placeholder="Email" value={user.email} onChange={handleChange} />
        <input type="password" name="password" placeholder="Mot de Passe" autoComplete="new-password" value={user.password} onChange={handleChange} />
        <button className={styles.btn} type="submit">S'inscrire</button>
      </form>
    );
  }

//   action="/api/createUser" method="post">
//  onSubmit={handleSubmit} >