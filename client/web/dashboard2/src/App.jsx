import { Routes, Route, Navigate } from "react-router-dom";
import { Dashboard, ProtectedRoute} from "@/layouts";
import { SignIn, SignUp } from "./pages/auth";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useState } from "react";

function App() {
  // const user = "null";
  const [user, setUser] = useState(null);
  return (
    <>
    <Routes>
      <Route path="/dashboard/*" element={
        <ProtectedRoute user={user}>
          <Dashboard />
        </ProtectedRoute>

      }/>

      <Route path="/auth/sign-in" element={<SignIn user={user} setUser={setUser} />} />
      <Route path="/auth/sign-up" element={<SignUp />} />
      
      {/* <Route path="/auth/*" element={<Auth />} /> */}
      {/* <Route path="*" element={<Navigate to="/dashboard/home" replace />} /> */}
    </Routes>
      <ToastContainer />
    </>
  );
}

export default App;
