import {
  getDoc,
  getDocs,
  collection,
  addDoc,
  deleteDoc,
  updateDoc,
  doc,
  setDoc,
  query,
  where,
} from "firebase/firestore";
import axios from "axios";

import { db, auth, storage } from "../configs/firebase";

export const fetchProjects = async () => {
  try {
    const projectsRef = collection(db, "Project");
    const data = await getDocs(projectsRef);

    const filteredData = data.docs.map((doc) => ({
      project_id: doc.id,
      ...doc.data(),
    }));

    return filteredData;
  } catch (err) {
    console.log("error in fetching projects", err);
  }
};

export const fetchProjectById = async (projID) => {
  try {
    const projectsRef = collection(db, "Project");
    const q = query(projectsRef, where("project_id", "==", projID));
    const querySnapshot = await getDocs(q);

    const filteredData = querySnapshot.docs.map((doc) => ({
      project_id: doc.id,
      ...doc.data(),
    }));

    return filteredData;
  } catch (err) {
    console.log("error in fetching project by ID", err);
  }
};

export const fetchUserById = async (userID) => {
  try {
    const usersRef = collection(db, "Profile");
    const q = query(usersRef, where("user_id", "==", userID));
    const querySnapshot = await getDocs(q);

    const filteredData = querySnapshot.docs.map((doc) => ({
      project_id: doc.id,
      ...doc.data(),
    }));

    return filteredData;
  } catch (err) {
    console.log("error in fetching user by ID", err);
  }
};

export const addCollabReq = async (projID, reqID, reqMsg) => {
  try {
    const projRef = doc(db, "Project");
    const q = query(projRef, where("project_id", "==", projID));
    const querySnapshot = await getDocs(q);
    const newReq = {
      user_id: reqID,
      user_message: reqMsg,
      is_request_in_hold: true,
      is_request_accepted: false,
    };
    const updated = querySnapshot.docs.colab_requests.push(newReq);
    const projUpdRef = doc(db, "Project", projID);
    await updateDoc(projUpdRef, {
      colab_requests: updated,
    });
  } catch (err) {
    console.log("error in sending message request", err);
  }
};
