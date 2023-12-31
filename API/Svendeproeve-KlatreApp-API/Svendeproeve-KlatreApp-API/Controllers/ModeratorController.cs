﻿using Grpc.Core;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Svendeproeve_KlatreApp_API.FirebaseDocuments;
using Svendeproeve_KlatreApp_API.Services;

namespace Svendeproeve_KlatreApp_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "Moderator, Admin")]
    public class ModeratorController : ControllerBase
    {
        private readonly FirebaseService _fireStoreService;
        public ModeratorController(FirebaseService firestoreService)
        {
            _fireStoreService = firestoreService;
        }

        private string ReplaceWSpace(string content)
        {
            return content.Replace(" ", "");
        }

        [HttpPost("/NewClimbingCenter/{climbingCenterName}&{description}&{location}&{defaultModerators}&{changerUserUID}")]
        public async Task NewClimbingCenter(string climbingCenterName, string description, string location, string defaultModerators, List<Areas> areas, string changerUserUID)
        {
            climbingCenterName = ReplaceWSpace(climbingCenterName);
            await _fireStoreService.AddClimbingCenter(new ClimbingCenterDocument 
            {
                CenterName = climbingCenterName,
                Description = description,
                Location = location,
                Moderator_Code = Guid.NewGuid().ToString(),
                Moderators = new List<string> { defaultModerators },
                Areas = areas
            }, climbingCenterName, changerUserUID);
        }

        [HttpGet("/RequestModeratorCode/{climbingCenterName}&{userUID}")]
        public async Task<string> RequestModeratorCode(string climbingCenterName, string userUID)
        {
            climbingCenterName = ReplaceWSpace(climbingCenterName);
            return await _fireStoreService.RequestModeratorCode(climbingCenterName, userUID);
        }

        [HttpGet("/CheckIfUserModeratorForCenter/{userUID}&{climbingCenterName}")]
        public async Task<bool> CheckIfUserModeratorForCenter(string userUID, string climbingCenterName)
        {
            climbingCenterName = ReplaceWSpace(climbingCenterName);
            return await _fireStoreService.CheckIfUserModeratorForCenter(userUID, climbingCenterName);
        }

        [HttpPost("/AddClimbingAreas/{climbingCenterName}&{changerUserUID}")]
        public async Task AddClimbingAreas(string climbingCenterName, string changerUserUID , List<Areas> areas)
        {
            climbingCenterName = ReplaceWSpace(climbingCenterName);
            await _fireStoreService.AddClimbingAreas(climbingCenterName, changerUserUID, areas);
        }

        [HttpPost("/AddRoutesToArea/{climbingCenterName}&{climbingArea}&{changerUserUID}")]
        public async Task AddClimbingRoutes(string climbingCenterName, string climbingArea, List<AreaRoutes> areaRoutes, string changerUserUID, bool systemChanger = false, bool routesDirectly = false)
        {
            climbingCenterName = ReplaceWSpace(climbingCenterName);
            await _fireStoreService.AddClimbingRoutes(climbingCenterName, climbingArea, areaRoutes, changerUserUID, systemChanger, routesDirectly);
        }

        [HttpDelete("/DeleteClimbingRoute/{climbingCenterName}&{climbingArea}&{problemId}&{changerUserUID}")]
        public async Task DeleteClimbingRoute(string climbingCenterName, string climbingArea, string problemId, string changerUserUID, bool systemChanger = false)
        {
            climbingCenterName = ReplaceWSpace(climbingCenterName);
            await _fireStoreService.DeleteClimbingRoute(climbingCenterName, climbingArea, problemId, changerUserUID, systemChanger);
        }
        [HttpDelete("/DeleteClimbingArea/{climbingCenterName}&{climbingArea}&{changerUserUID}")]
        public async Task DeleteClimbingArea(string climbingCenterName, string climbingArea, string changerUserUID, bool systemChanger = false)
        {
            await _fireStoreService.DeleteClimbingArea(climbingCenterName, climbingArea, changerUserUID, systemChanger);
        }

        [HttpDelete("/DeleteClimbingCenter/{climbingCenterName}")]
        public async Task DeleteClimbingCenter(string climbingCenterName)
        {
            await _fireStoreService.DeleteClimbingCenter(climbingCenterName);
        }

        [HttpPatch("/UpdateClimbingRoutes/{climbingCenterName}&{climbingArea}&{changerUserUID}")]
        public async Task UpdateClimbingRoutes(AreaRoutes areaRoutes, string climbingCenterName, string climbingArea, string changerUserUID, bool systemChanger = false)
        {
            await _fireStoreService.UpdateClimbingRoutes(areaRoutes, climbingCenterName, climbingArea, changerUserUID, systemChanger);
        }
        [HttpPatch("/UpdateClimbingArea/{climbingCenterName}&{climbingArea}&{newValue}&{changerUserUID}")]
        public async Task UpdateClimbingArea(string climbingCenterName, string climbingArea, string newValue, string changerUserUID, bool systemChanger = false)
        {
            await _fireStoreService.UpdateClimbingArea(climbingCenterName, climbingArea, newValue, changerUserUID, systemChanger);
        }

    }
}
