﻿using FirebaseAdmin;
using FirebaseAdmin.Auth;
using Google.Cloud.Firestore;
using Svendeproeve_KlatreApp_API.FirebaseDocuments;
using Svendeproeve_KlatreApp_API.Services.SubServices;
using System.Linq;

namespace Svendeproeve_KlatreApp_API.Services
{
    public class FirebaseService
    {
        private readonly ProfileDataService _profileDataService;
        private readonly KlatrecentreService _klatrecentreService;
        private readonly ModeratorService _moderatorService;
        private readonly LoginVerificationService _loginVerificationService;
        private readonly GripsService _gripsService;
        private readonly ExerciseService _exerciseService;
        private readonly WorkoutService _workoutService;
        public FirebaseService(ProfileDataService profileDataService, 
            KlatrecentreService klatrecentreService, 
            ModeratorService moderatorService, 
            LoginVerificationService loginVerificationService, 
            GripsService gripsService,
            ExerciseService exerciseService,
            WorkoutService workoutService)
        {
            _profileDataService = profileDataService;
            _klatrecentreService = klatrecentreService;
            _moderatorService = moderatorService;
            _loginVerificationService = loginVerificationService;
            _gripsService = gripsService;
            _exerciseService = exerciseService;
            _workoutService = workoutService;
        }

        //public async Task<List<Shoe>> GetAll()
        //{
        //    var collection = _firestoreDb.Collection(_collectionName);
        //    var snapshot = await collection.GetSnapshotAsync();

        //    var shoeDocuments = snapshot.Documents.Select(s => s.ConvertTo<ShoeDocument>()).ToList();
        //    return shoeDocuments.Select(ConvertDocumentToModel).ToList();
        //}
        //public async Task AddAsync(Shoe shoe)
        //{   
        //    var collection = _firestoreDb.Collection(_collectionName);
        //    var shoeDocument = ConvertModelToDocument(shoe);
        //    await collection.AddAsync(shoeDocument);
        //}
        //private static Shoe ConvertDocumentToModel(ShoeDocument shoeDocument)
        //{
        //    return new Shoe
        //    {
        //        Id = shoeDocument.Id,
        //        Name = shoeDocument.Name,
        //        Brand = shoeDocument.Brand,
        //        Price = decimal.Parse(shoeDocument.Price)
        //    };
        //}
        //private static ShoeDocument ConvertModelToDocument(Shoe shoe)
        //{
        //    return new ShoeDocument
        //    {
        //        Id = shoe.Id,
        //        Name = shoe.Name,
        //        Brand = shoe.Brand,
        //        Price = shoe.Price.ToString()
        //    };
        //}
        public async Task AddProfileData(ProfileDataDocument profileData)
        {
            await _profileDataService.AddProfileData(profileData);
        }

        public async Task<ProfileDataDocument> GetProfileData(string userUID)
        {
            return await _profileDataService.GetProfileData(userUID);
        }

        public async Task DeleteProfileData(string userUID)
        {
            await _profileDataService.DeleteProfileData(userUID);
        }

        public async Task UpdateProfileData(ProfileDataDocument newProfile, string userUID)
        {
           await _profileDataService.UpdateProfileData(newProfile, userUID);
        }

        public async Task<List<ClimbingScoreDocument>> GetClimbingScores(string climbingCenter)
        {
            return await _profileDataService.GetClimbingScores(climbingCenter);
        }

        public async Task AddClimbingCenter(ClimbingCenterDocument climbingCenter, string climbingCenterName)
        {
            await _klatrecentreService.AddClimbingCenter(climbingCenter, climbingCenterName);
        }

        public async Task AddAreaToClimbingCenter(string climbingCenterName, Areas area)
        {
            await _klatrecentreService.AddAreaToClimbingCenter(climbingCenterName, area);
        }

        public async Task AddClimbingRoutes(string climbingCenterName, string climbingArea, List<AreaRoutes> areaRoutes, string changerUserUID)
        {
            await _klatrecentreService.AddClimbingRoutes(climbingCenterName, climbingArea, areaRoutes, changerUserUID);
        }

        public async Task<List<ClimbingCenterDocument>> GetClimbingCentre()
        {
            return await _klatrecentreService.GetClimbingCentre();
        }

        public async Task<bool> CheckIfUserModerator(string userUID)
        {
            return await _moderatorService.CheckIfUserModerator(userUID);
        }

        public async Task<string> RequestModeratorCode(string climbingCenterName, string userUID)
        {
            return await _moderatorService.RequestModeratorCode(climbingCenterName, userUID);
        }

        public async Task CheckModeratorCodeAndAddToCenter(string moderatorCode, string userUID)
        {
            await _moderatorService.CheckModeratorCodeAndAddToCenter(moderatorCode, userUID);
        }

        public async Task<bool> CompareSecretValues(string fireBaseSecret)
        {
            return await _loginVerificationService.CompareSecretValues(fireBaseSecret);
        }

        public async Task CreateNewGripsCollection(GripsDocument gripsService)
        {
            await _gripsService.CreateNewGripsCollection(gripsService);
        }

        public async Task<GripsDocument> GetGrip(string gripName)
        {
            return await _gripsService.GetGrip(gripName);
        }

        public async Task<List<GripsDocument>> GetGrips()
        {
            return await _gripsService.GetGrips();
        }

        public async Task UpdateGrip(string gripName, string fieldToChange, string newValue)
        {
            await _gripsService.UpdateGrip(gripName, fieldToChange, newValue);
        }

        public async Task DeleteGrip(string gripName)
        {
            await _gripsService.DeleteGrip(gripName);
        }

        public async Task CreateNewExercise(ExerciseDocument excerciseDocument)
        {
            await _exerciseService.CreateNewExercise(excerciseDocument);
        }

        public async Task<ExerciseDocument> GetExercise(string exerciseName)
        {
            return await _exerciseService.GetExercise(exerciseName);
        }

        public async Task<List<ExerciseDocument>> GetExercises()
        {
            return await _exerciseService.GetExercises();
        }

        public async Task<List<ExerciseDocument>> GetExercisesIncludedIn(string musclegroups)
        {
            return await _exerciseService.GetExercisesIncludedIn(musclegroups);
        }

        public async Task UpdateExercise(ExerciseDocument newExercise, string exerciseName)
        {
            await _exerciseService.UpdateExercise(newExercise, exerciseName);
        }

        public async Task DeleteExercise(string exerciseName)
        {
            await _exerciseService.DeleteExercise(exerciseName);
        }

        public async Task CreateNewWorkout(WorkoutDocument workoutDocument)
        {
            await _workoutService.CreateNewWorkout(workoutDocument);
        }

        public async Task<WorkoutDocument> GetWorkout(string workoutID)
        {
            return await _workoutService.GetWorkout(workoutID);
        }

        public async Task<List<WorkoutDocument>> GetWorkouts()
        {
            return await _workoutService.GetWorkouts();
        }

        public async Task UpdateWorkout(WorkoutDocument newWorkout, string workoutID)
        {
            await _workoutService.UpdateWorkout(newWorkout, workoutID);
        }

        public async Task DeleteWorkout(string workoutID)
        {
            await _workoutService.DeleteWorkout(workoutID);
        }
    }
}
