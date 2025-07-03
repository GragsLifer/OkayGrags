
				t += anim.m_neck_delay\
			elseif motor.Name:find(\"Hip\")then\
				t += anim.m_hip_delay\
			elseif motor.Name:find(\"Shoulder\")then\
				t += anim.m_shoulder_delay\
			end\
			local e = 0.5 + (math.sin(t) / 2)\
			if motor:IsA('Motor6D') then\
				if motor.Name == 'fw' then\
					motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.m[2][motor.Name], e), lerpSpeed)\
				else\
					motor.C0 = motor.C0:Lerp(pose:Lerp(anim.m[2][motor.Name], e), lerpSpeed)\
				end\
			elseif motor:IsA('Bone') then\
				motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.m[2][motor.Name], e), lerpSpeed)\
			end\
		end\
	end\
	for motor, pose in anim.f[1] do \
		motor = f:FindFirstChild(motor, true)\
		if motor then\
			local t = sine + anim.f_delay\
			if motor.Name == \"Neck\"then\
				t += anim.f_neck_delay\
			elseif motor.Name:find(\"Hip\")then\
				t += anim.f_hip_delay\
			elseif motor.Name:find(\"Shoulder\")then\
				t += anim.f_shoulder_delay\
			elseif motor.Name == \"bw\" or motor.Name == \"rbw\" or motor.Name == \"lbw\" then\
				t += anim.bw_delay\
			end\
			local e = 0.5 + (math.sin(t) / 2) \
			if motor:IsA('Motor6D') then\
				motor.C0 = motor.C0:Lerp(pose:Lerp(anim.f[2][motor.Name], e), lerpSpeed)\
			elseif motor:IsA('Bone') then\
				motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.f[2][motor.Name], e), lerpSpeed)\
			end\
		end\
	end\
	local a = ((ack-1)%4) + 1\
	local over25 = false\
	if not ismn then\
		if speed >= 25 then\
			over25 = true\
			m3 = 0 \
			m2 = 1 \
			m1 = 1\
		else \
			over25 = false\
			m3 = 1\
			m2 = 1\
			m1 = 0\
		end\
	end\
	if t > anim.sfx/speed then\
		t = 0\
		ack = math.min(ack + 1, max)\
		if not anim.head then\
			fsfx(8142423452, 2)\
			fsfx(sfx2[a], 2)\
		else \
			fsfx(8142423452, 2)\
			fsfx(9114122475, 1, 1.5)\
		end\
		if math.random() <= (anim.sfx/speed)/2 and not ismn then\
			ismn = true\
			--[[local m = fsfx(sfx[a], 1)\
			if anim.head then\
				--m.Volume = 2\
				m.Volume = 0.5\
				script.eq:Clone().Parent = m\
			end]]\
			m3 = 0 \
			m2 = 1 \
			m1 = 1\
			local l, l2 = over25 and 1 or 0, over25 and 0 or 1\
			task.delay(0.2, function()\
				if isdn then\
					return\
				end\
				m3 = 1 \
				m2 = 0\
				m1 = 1\
				task.wait(0.2)\
				if isdn then\
					return\
				end\
				m3 = 1 \
				m2 = 1\
				m1 = 1\
				f.face.mouth4.Transparency = 0\
				task.wait(0.2)\
				if isdn then\
					return\
				end\
				f.face.mouth4.Transparency = 1\
				ismn = false\
				m3 = l2\
				m2 = 1\
				m1 = l\
			end)\
		end\
		if lplr.Name == m.Name then\
			if ack <= math.floor(max/2.5) and not rel then\
				lplr.PlayerGui.ui.Frame.start.bar.Size = UDim2.fromScale(1, ack/math.floor(max/2.5))\
				plap += 1\
				\
				if plap % 5 == 0 then\
					task.defer(function()\
						f.v:FindFirstChild(\"prt\",true):Emit(math.random(1,5))\
					end)\
				end\
			else \
				local s = (ack-math.floor(max/2.5))/(max-math.floor(max/2.5))\
				lplr.PlayerGui.ui.Frame.meter.bar.Size = UDim2.fromScale(1, math.min(1, s))\
				if rel then --s == 1 then\
					isdn = true\
					ismn = true\
					m3 = 0 \
					m2 = 1 \
					m1 = 1\
					f.face.eyes2.Transparency = 0\
					f.face.eyes.Transparency = 1\
					task.delay(0.2, function()\
						m3 = 1 \
						m2 = 0\
						task.wait(0.2)\
						m2 = 1\
						f.face.mouth4.Transparency = 0\
						task.wait(0.5)\
						f.face.mouth4.Transparency = 1\
						f.face.mouth5.Transparency = 0\
					end)\
					local mn = fsfx(2440889605, 1)\
					if anim.head then\
						mn.Volume = 2\
						script.eq:Clone().Parent = mn\
					end\
					fsfx(sfx2[a], 0.9)\
\
\
					task.defer(function()\
						for i = 1, 4 do \
							task.wait(0.7)\
							if not anim.head and not anim.b then\
								f.v:FindFirstChild(\"prt\",true):Emit(17)\
							elseif anim.head and not anim.b then\
								f.Head:FindFirstChild(\"prt\",true):Emit(17)\
							else \
								m.fortnite:FindFirstChild(\"prt\",true):Emit(17)\
							end\
							if anim.cumshot then\
								--local shot = script.CumShot:Clone()\
								--local pivotpoint = shot:GetPivot().Position\
								--for _,v in shot:GetChildren() do\
								--	if v:IsA(\"BasePart\") then\
								--		v.Position = pivotpoint\
								--		v.CanCollide = true\
								--		v.Anchored = false\
								--		v.TopSurface = Enum.SurfaceType.Glue\
								--		v.BottomSurface = Enum.SurfaceType.Glue\
								--		v.LeftSurface = Enum.SurfaceType.Glue\
								--		v.RightSurface = Enum.SurfaceType.Glue\
								--		v.FrontSurface = Enum.SurfaceType.Glue\
								--		v.BackSurface	 = Enum.SurfaceType.Glue\
								--	end\
								--end\
								--local shotcframe = m.fortnite:FindFirstChildWhichIsA(\"Attachment\",true).WorldCFrame\
								--shot:PivotTo(shotcframe + shotcframe.LookVector * 0.1)\
								--shot.Parent = workspace.Terrain\
								--shot:GetChildren()[1].AssemblyLinearVelocity = shotcframe.LookVector * math.random(50,100)\
								--game.Debris:AddItem(shot, 5)\
								local shotcframe = m.fortnite:FindFirstChildWhichIsA(\"Attachment\",true).WorldCFrame\
								local shotvel = shotcframe.LookVector * 20 + Vector3.new(\
									math.random(-5, 5),\
									0,\
									math.random(-5, 5)\
								)\
								task.defer(newcumshot, shotcframe, shotvel, cm_ignore)\
							else\
								local params = RaycastParams.new()\
								params.RespectCanCollide = true\
								params.FilterDescendantsInstances = {m, f}\
								local results = workspace:Raycast(m.fortnite:FindFirstChildWhichIsA(\"Attachment\",true).WorldPosition, Vector3.new(0,-999.999,0), params)\
								if results then\
									local puddle = script.Puddle:Clone()\
									puddle.CanQuery = false\
									puddle.CanTouch = false\
									puddle.Anchored = true\
									puddle.CanCollide = false\
									puddle.Transparency = 0.1\
									puddle.CFrame = CFrame.new(results.Position, results.Position + results.Normal) * CFrame.fromOrientation(-math.rad(90),0,0) * CFrame.fromOrientation(0, math.rad(math.random(0,360)), 0)\
									puddle.Parent = workspace.Terrain\
									task.delay(4, function()\
										game:GetService(\"TweenService\"):Create(puddle, TweenInfo.new(0.7), {Transparency = 1}):Play()\
									end)\
									game.Debris:AddItem(puddle, 5)\
								end\
							end\
							\
							if not anim.head and not anim.b then\
								for i,v in (anim.anal and f.v.Anus:GetChildren() or f.v:GetChildren()) do \
									if v.Name == \"d\" and v:IsA(\"BasePart\") then\
										local s = v.Size\
										v.Size *= 1.6\
										game:GetService(\"TweenService\"):Create(v, TweenInfo.new(0.7, Enum.EasingStyle.Elastic), {Transparency = 0, Size = s}):Play()\
									end\
								end\
							elseif anim.head and not anim.b then \
								local v = f.Head.d\
								local s = v.Size\
								v.Size *= 1.6\
								game:GetService(\"TweenService\"):Create(v, TweenInfo.new(0.7, Enum.EasingStyle.Elastic), {Transparency = 0, Size = s}):Play()\
							else \
								for i,v in f.a:GetChildren() do \
									if v.Name == \"d\" and v:IsA(\"BasePart\") then\
										local s = v.Size\
										v.Size *= 1.6\
										game:GetService(\"TweenService\"):Create(v, TweenInfo.new(0.7, Enum.EasingStyle.Elastic), {Transparency = 0, Size = s}):Play()\
									end\
								end\
							end\
\
\
							for i,v in m.fortnite:GetDescendants() do \
								if v.Name == \"d\" and v:IsA(\"BasePart\")then\
									local s = v.Size\
									v.Size *= 1.6\
									game:GetService(\"TweenService\"):Create(v, TweenInfo.new(0.7, Enum.EasingStyle.Elastic), {Transparency = 0, Size = s}):Play()\
								end\
							end\
							fsfx(491214142, 1, 0.35)\
							fsfx(8142423452, 1.4)\
						end\
					end)\
					local p2 = {}\
					for motor, pose in anim.f_done do \
						motor = f:FindFirstChild(motor, true)\
						if motor:IsA('Motor6D') then\
							p2[motor] = motor.C0:Lerp(pose, 1.4)\
						else\
							p2[motor] = motor.Transform:Lerp(pose, 1.4)\
						end\
					end\
					local mp2 = {}\
					if anim.m_done then\
						for motor, pose in anim.m_done do \
							motor = m:FindFirstChild(motor, true)\
							if motor then\
								--mp2[motor] = motor.C0:Lerp(pose, 1.4)\
								if motor.Name == 'fw' then\
									mp2[motor] = motor.Transform:Lerp(pose, 1.4)\
								else\
									mp2[motor] = motor.C0:Lerp(pose, 1.4)\
								end\
							else\
								mp2[motor] = motor.Transform:Lerp(pose, 1.4)\
							end\
						end\
					end\
					for i = 1, 250 do \
						sine += task.wait() * 23\
						if m.Name == lplr.Name then\
							lplr.PlayerGui.ui.Frame.start.bar.Size = lplr.PlayerGui.ui.Frame.start.bar.Size:Lerp(UDim2.fromScale(1, 0), 0.15)\
							lplr.PlayerGui.ui.Frame.meter.bar.Size = lplr.PlayerGui.ui.Frame.meter.bar.Size:Lerp(UDim2.fromScale(1, 0), 0.15)\
						end\
						if anim.m_done then\
							for motor, pose in anim.m_done do \
								motor = m:FindFirstChild(motor, true)\
								if motor then\
									local t = sine + anim.m_delay\
									if motor.Name == \"Neck\"then\
										t += anim.m_neck_delay\
									elseif motor.Name:find(\"Hip\")then\
										t += anim.m_hip_delay\
									elseif motor.Name:find(\"Shoulder\")then\
										t += anim.m_shoulder_delay\
									end\
									if mp2[motor] then\
										if motor:IsA('Motor6D') then\
											--local pivot = if motor.Name == 'fw' then motor.C1 else CFrame.new()\
											--motor.C0 = pivot * motor.C0:Lerp(mp2[motor]:Lerp(pose,  0.5 + (math.sin(t)/2)), 0.15)\
											if motor.Name == 'fw' then\
												motor.Transform = motor.Transform:Lerp(mp2[motor]:Lerp(pose, 0.5 + (math.sin(t)/2)), 0.15)\
											else\
												motor.C0 = motor.C0:Lerp(mp2[motor]:Lerp(pose, 0.5 + (math.sin(t)/2)), 0.15)\
											end\
										elseif motor:IsA('Bone') then\
											motor.Transform = motor.Transform:Lerp(mp2[motor]:Lerp(pose,  0.5 + (math.sin(t)/2)), 0.15)\
										end\
									end\
								end\
							end\
						else\
							for motor, pose in anim.m[1] do \
								motor = m:FindFirstChild(motor, true)\
								if motor then\
									local t = sine + anim.m_delay\
									if motor.Name == \"Neck\"then\
										t += anim.m_neck_delay\
									elseif motor.Name:find(\"Hip\")then\
										t += anim.m_hip_delay\
									elseif motor.Name:find(\"Shoulder\")then\
										t += anim.m_shoulder_delay\
									end\
									local e = 0.5 + (math.sin(t) / 2)\
									if motor:IsA('Motor6D') then\
										if motor.Name == 'fw' then\
											motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.m[2][motor.Name], e), lerpSpeed)\
										else\
											motor.C0 = motor.C0:Lerp(pose:Lerp(anim.m[2][motor.Name], e), lerpSpeed)\
										end\
									elseif motor:IsA('Bone') then\
										motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.m[2][motor.Name], e), lerpSpeed)\
									end\
								end\
							end\
						end\
\
						for motor, pose in anim.f_done do \
							motor = f:FindFirstChild(motor, true)\
							if motor then\
								local t = sine + anim.f_delay\
								if motor.Name == \"Neck\"then\
									t += anim.f_neck_delay\
								elseif motor.Name:find(\"Hip\")then\
									t += anim.f_hip_delay\
								elseif motor.Name:find(\"Shoulder\")then\
									t += anim.f_shoulder_delay\
								elseif motor.Name == \"bw\" or motor.Name == \"rbw\" or motor.Name == \"lbw\" then\
									t += anim.bw_delay\
								end\
								if p2[motor] then\
									if motor:IsA('Motor6D') then\
										motor.C0 = motor.C0:Lerp(p2[motor]:Lerp(pose,  0.5 + (math.sin(t)/2)), 0.15)\
									elseif motor:IsA('Bone') then\
										motor.Transform = motor.Transform:Lerp(p2[motor]:Lerp(pose,  0.5 + (math.sin(t)/2)), 0.15)\
									end\
								end\
							end\
						end\
					end\
					for i = 1, 100 do \
						for motor, pose in anim.f_done do \
							motor = f:FindFirstChild(motor, true)\
							if motor then\
								local t = sine + anim.f_delay\
								if motor.Name == \"Neck\"then\
									t += anim.f_neck_delay\
								elseif motor.Name:find(\"Hip\")then\
									t += anim.f_hip_delay\
								elseif motor.Name:find(\"Shoulder\")then\
									t += anim.f_shoulder_delay\
								elseif motor.Name == \"bw\" or motor.Name == \"rbw\" or motor.Name == \"lbw\" then\
									t += anim.bw_delay\
								end\
								if p2[motor] then\
									if motor:IsA('Motor6D') then\
										if motor.Name == 'fw' then\
											motor.Transform = motor.Transform:Lerp(p2[motor]:Lerp(pose,  0.5 + (math.sin(t)/2)), 0.15)\
										else\
											motor.C0 = motor.C0:Lerp(p2[motor]:Lerp(pose,  0.5 + (math.sin(t)/2)), 0.15)\
										end\
									elseif motor:IsA('Bone') then\
										motor.Transform = motor.Transform:Lerp(p2[motor]:Lerp(pose,  0.5 + (math.sin(t)/2)), 0.15)\
									end\
								end\
							end\
						end\
					end\
					for i = 1, 50 do \
						task.wait()\
						for motor, pose in anim.f[1] do \
							motor = f:FindFirstChild(motor, true)\
							if motor then\
								local t = sine + anim.f_delay\
								if motor.Name == \"Neck\"then\
									t += anim.f_neck_delay\
								elseif motor.Name:find(\"Hip\")then\
									t += anim.f_hip_delay\
								elseif motor.Name:find(\"Shoulder\")then\
									t += anim.f_shoulder_delay\
								elseif motor.Name == \"bw\" or motor.Name == \"rbw\" or motor.Name == \"lbw\" then\
									t += anim.bw_delay\
								end\
								local e = 0.5 + (math.sin(t) / 2) \
								if motor:IsA('Motor6D') then\
									motor.C0 = motor.C0:Lerp(pose:Lerp(anim.f[2][motor.Name], e), i/50)\
								elseif motor:IsA('Bone') then\
									motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.f[2][motor.Name], e), i/50)\
								end\
							end\
						end\
						for motor, pose in anim.m[1] do \
							motor = m:FindFirstChild(motor, true)\
							if motor then\
								local t = sine + anim.m_delay\
								if motor.Name == \"Neck\"then\
									t += anim.m_neck_delay\
								elseif motor.Name:find(\"Hip\")then\
									t += anim.m_hip_delay\
								elseif motor.Name:find(\"Shoulder\")then\
									t += anim.m_shoulder_delay\
								end\
								local e = 0.5 + (math.sin(t) / 2) \
								if motor:IsA('Motor6D') then\
									if motor.Name == 'fw' then\
										motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.m[2][motor.Name], e), i/50)\
									else\
										motor.C0 = motor.C0:Lerp(pose:Lerp(anim.m[2][motor.Name], e), i/50)\
									end\
								elseif motor:IsA('Bone') then\
									motor.Transform = motor.Transform:Lerp(pose:Lerp(anim.m[2][motor.Name], e), i/50)\
								end\
							end\
						end\
\
					end\
					ismn = false\
					f.face.mouth4.Transparency = 1\
					f.face.mouth5.Transparency = 1\
					f.face.eyes2.Transparency = 1\
					f.face.eyes.Transparency = 0\
					isdn = false\
					local l, l2 = over25 and 1 or 0, over25 and 0 or 1\
					m1 = l\
					m2 = 1 \
					m3 = l2\
					ack = 0\
					local sm = speedMult\
					speedMult = 0\
					task.defer(function()\
						for i = 1, 350 do \
							task.wait()\
							speedMult = lerp(0, sm, i/350)\
						end\
					end)\
					rel = false\
				end\
			end\
		end\
	end		\
	updating = false\
end)\
--end"
obj879504.Parent = game.ServerStorage
    local obj437534 = Instance.new("ModuleScript")
    obj437534.Name = "animations"
    obj437534.Source = "return {\
	cg = {\
		m_neck_delay = 1,\
		m_hip_delay = 0,\
		m_shoulder_delay = 1,\
		f_neck_delay = -1.5,\
		f_hip_delay = 0.5,\
		f_shoulder_delay = 0,\
		m_delay = 0,\
		f_delay = 0.5,\
		default = 10,\
		sfx = 5.8,\
		fortnite = CFrame.Angles(math.rad(-28), 0, 0),\
		offset = CFrame.new(0, 0.1, -0.4) * CFrame.Angles(math.rad(12), 0, 0),\
		shield_offset = CFrame.new(0,0,0),\
		rshield_offset = CFrame.new(0.5,0.5,-0.5),\
		lshield_offset = CFrame.new(-0.5,0.5,-0.5),\
		bw_delay = -1,\
		f_when_done = true,\
		c_offset = CFrame.new(0, -1.4, -2) * CFrame.Angles(math.rad(-7), math.pi, 0),\
		transparent = false,\
		t_transparent = false,\
		cumshot = true,\
		f_done = {\
			--[\"RootJoint\"] = CFrame.new(0, -0.67, -0.88) * CFrame.Angles(math.rad(-75.54), math.rad(-0.01), math.rad(179.98)) - Vector3.new(0, 0.2, 0) - Vector3.new(0, 0.1, 0);\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-77.89), math.rad(0), math.rad(179.98));\
			[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-71.69)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
			--[\"Left Hip\"] = CFrame.new(--[[0.03]] -.36 + .5, -1.07, -0.35) * CFrame.Angles(math.rad(169.33), -math.rad(48.17), -math.rad(-71.69));\
			[\"Right Shoulder\"] = CFrame.new(1.05, -0.06, -0.08) * CFrame.Angles(math.rad(-3.52), math.rad(58.79), math.rad(-21.6));\
			--[\"Right Hip\"] = CFrame.new(0.36 - .5, -1.02, -0.54) * CFrame.Angles(math.rad(169.81), -math.rad(-38.46), -math.rad(78.93));\
			[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(78.93)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, -math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
			[\"Left Shoulder\"] = CFrame.new(-0.78, 0, -0.09) * CFrame.Angles(math.rad(-6.56), math.rad(-58.69), math.rad(7.45));\
		},\
		m = {\
			{\
				[\"RootJoint\"] = CFrame.new(0.03, -2.6, -2.99) * CFrame.Angles(math.rad(178.09), math.rad(0.64), math.rad(-0.01));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-108.63), math.rad(3.86), math.rad(-178.72));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-69.21), math.rad(-66.46), math.rad(-69.23));\
				[\"Right Shoulder\"] = CFrame.new(0.88, 0.63, 0.04) * CFrame.Angles(math.rad(-113.35), math.rad(73.89), math.rad(129.69));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-68.17), math.rad(62.78), math.rad(67.58));\
				[\"Left Shoulder\"] = CFrame.new(-0.99, 0.5, 0.04) * CFrame.Angles(math.rad(-37.48), math.rad(-76.8), math.rad(-54.51));\
			};\
			{\
				[\"RootJoint\"] = CFrame.new(0.03, -2.6, -2.99) * CFrame.Angles(math.rad(-178.94), math.rad(0.64), math.rad(-0.04));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-103.63), math.rad(3.96), math.rad(-179.07));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-69.21), math.rad(-66.46), math.rad(-72.29));\
				[\"Right Shoulder\"] = CFrame.new(0.88, 0.63, 0.04) * CFrame.Angles(math.rad(-113.35), math.rad(73.89), math.rad(130.74));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-68.17), math.rad(62.78), math.rad(70.65));\
				[\"Left Shoulder\"] = CFrame.new(-0.99, 0.5, 0.04) * CFrame.Angles(math.rad(-37.48), math.rad(-76.8), math.rad(-56.51));\
			}\
		},\
		f = {\
			{\
				--[\"bw\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10), 0, 0),\
				[\"rbw\"] = CFrame.new(0.5, 0.5, -0.5) * CFrame.Angles(math.rad(10), 0, 0),\
				[\"lbw\"] = CFrame.new(-0.5, 0.5, -0.5) * CFrame.Angles(math.rad(10), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -0.67, -0.88) * CFrame.Angles(math.rad(-80.23), math.rad(0), math.rad(179.98));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-106.38), math.rad(0.01), math.rad(179.98));\
				--[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-79.88)) * CFrame.new(0, 0, 1);\
				[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-79.88)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, math.rad(80)) + Vector3.new(0, 0.35, -0.25);\
				[\"Right Shoulder\"] = CFrame.new(1.05, -0.06, -0.08) * CFrame.Angles(math.rad(-3.52), math.rad(58.79), math.rad(-13.53)) - Vector3.new(0, 0.23, 0);\
				--[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(87.85)) * CFrame.new(0, 0, 1);\
				[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(87.85)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, -math.rad(80)) + Vector3.new(0, 0.35, -0.25);\
				[\"Left Shoulder\"] = CFrame.new(-0.78, 0, -0.09) * CFrame.Angles(math.rad(-6.56), math.rad(-58.69), math.rad(-0.62)) - Vector3.new(0, 0.23, 0);\
			};\
			{\
				--[\"bw\"] = CFrame.new(0, -0.08, 0) * CFrame.Angles(math.rad(-4), 0, 0),\
				[\"rbw\"] = CFrame.new(0.5, 0.5, -0.5) * CFrame.Angles(math.rad(-4), 0, 0),\
				[\"lbw\"] = CFrame.new(-0.5, 0.5, -0.5) * CFrame.Angles(math.rad(-4), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -0.91, -0.92) * CFrame.Angles(math.rad(-80.23), math.rad(0), math.rad(179.98)) + Vector3.new(0, -0.5, 0);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-112.86), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-72.8)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
				[\"Right Shoulder\"] = CFrame.new(1.08, 0.2, -0.15) * CFrame.Angles(math.rad(-4.28), math.rad(57.06), math.rad(-12.88)) - Vector3.new(0, 0.23, 0);\
				[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(79.57)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, -math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
				[\"Left Shoulder\"] = CFrame.new(-0.77, 0.26, -0.11) * CFrame.Angles(math.rad(-6.5), math.rad(-55.65), math.rad(-0.57)) - Vector3.new(0, 0.23, 0);\
			}\
		}\
	},\
	\
	acg = {\
		m_neck_delay = 1,\
		m_hip_delay = 0,\
		m_shoulder_delay = 1,\
		f_neck_delay = -1.5,\
		f_hip_delay = 0.5,\
		f_shoulder_delay = 0,\
		m_delay = 0,\
		f_delay = 0.5,\
		default = 10,\
		sfx = 5.8,\
		fortnite = CFrame.Angles(math.rad(-5), 0, 0),\
		offset =  CFrame.new(0, 0.1, -0.4) * CFrame.Angles(math.rad(12), 0, 0) + Vector3.new(0, 0, -.3),\
		shield_offset = CFrame.new(0,0,0),\
		rshield_offset = CFrame.new(0.5,0.5,-0.5),\
		lshield_offset = CFrame.new(-0.5,0.5,-0.5),\
		bw_delay = -1,\
		f_when_done = true,\
		c_offset = CFrame.new(0, -1.4, -2) * CFrame.Angles(math.rad(-7), math.pi, 0),\
		transparent = false,\
		t_transparent = false,\
		cumshot = true,\
		anal = true,\
		f_done = {\
			[\"RootJoint\"] = CFrame.new(0, -0.67, -0.88) * CFrame.Angles(math.rad(-75.54), math.rad(-0.01), math.rad(179.98)) - Vector3.new(0, 0.2, 0) - Vector3.new(0, 0.1, 0);\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-77.89), math.rad(0), math.rad(179.98));\
			[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-71.69)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
			--[\"Left Hip\"] = CFrame.new(--[[0.03]] -.36 + .5, -1.07, -0.35) * CFrame.Angles(math.rad(169.33), -math.rad(48.17), -math.rad(-71.69));\
			[\"Right Shoulder\"] = CFrame.new(1.05, -0.06, -0.08) * CFrame.Angles(math.rad(-3.52), math.rad(58.79), math.rad(-21.6));\
			--[\"Right Hip\"] = CFrame.new(0.36 - .5, -1.02, -0.54) * CFrame.Angles(math.rad(169.81), -math.rad(-38.46), -math.rad(78.93));\
			[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(78.93)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, -math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
			[\"Left Shoulder\"] = CFrame.new(-0.78, 0, -0.09) * CFrame.Angles(math.rad(-6.56), math.rad(-58.69), math.rad(7.45));\
		},\
		m = {\
			{\
				[\"RootJoint\"] = CFrame.new(0.03, -2.6, -2.99) * CFrame.Angles(math.rad(178.09), math.rad(0.64), math.rad(-0.01));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-108.63), math.rad(3.86), math.rad(-178.72));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-69.21), math.rad(-66.46), math.rad(-69.23));\
				[\"Right Shoulder\"] = CFrame.new(0.88, 0.63, 0.04) * CFrame.Angles(math.rad(-113.35), math.rad(73.89), math.rad(129.69));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-68.17), math.rad(62.78), math.rad(67.58));\
				[\"Left Shoulder\"] = CFrame.new(-0.99, 0.5, 0.04) * CFrame.Angles(math.rad(-37.48), math.rad(-76.8), math.rad(-54.51));\
			};\
			{\
				[\"RootJoint\"] = CFrame.new(0.03, -2.6, -2.99) * CFrame.Angles(math.rad(-178.94), math.rad(0.64), math.rad(-0.04));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-103.63), math.rad(3.96), math.rad(-179.07));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-69.21), math.rad(-66.46), math.rad(-72.29));\
				[\"Right Shoulder\"] = CFrame.new(0.88, 0.63, 0.04) * CFrame.Angles(math.rad(-113.35), math.rad(73.89), math.rad(130.74));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-68.17), math.rad(62.78), math.rad(70.65));\
				[\"Left Shoulder\"] = CFrame.new(-0.99, 0.5, 0.04) * CFrame.Angles(math.rad(-37.48), math.rad(-76.8), math.rad(-56.51));\
			}\
		},\
		f = {\
			{\
				--[\"bw\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(10), 0, 0),\
				[\"rbw\"] = CFrame.new(0.5, 0.5, -0.5) * CFrame.Angles(math.rad(10), 0, 0),\
				[\"lbw\"] = CFrame.new(-0.5, 0.5, -0.5) * CFrame.Angles(math.rad(10), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -0.67, -0.88) * CFrame.Angles(math.rad(-80.23), math.rad(0), math.rad(179.98));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-106.38), math.rad(0.01), math.rad(179.98));\
				--[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-79.88)) * CFrame.new(0, 0, 1);\
				[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-79.88)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, math.rad(80)) + Vector3.new(0, 0.35, -0.25);\
				[\"Right Shoulder\"] = CFrame.new(1.05, -0.06, -0.08) * CFrame.Angles(math.rad(-3.52), math.rad(58.79), math.rad(-13.53)) - Vector3.new(0, 0.23, 0);\
				--[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(87.85)) * CFrame.new(0, 0, 1);\
				[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(87.85)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, -math.rad(80)) + Vector3.new(0, 0.35, -0.25);\
				[\"Left Shoulder\"] = CFrame.new(-0.78, 0, -0.09) * CFrame.Angles(math.rad(-6.56), math.rad(-58.69), math.rad(-0.62)) - Vector3.new(0, 0.23, 0);\
			};\
			{\
				--[\"bw\"] = CFrame.new(0, -0.08, 0) * CFrame.Angles(math.rad(-4), 0, 0),\
				[\"rbw\"] = CFrame.new(0.5, 0.5, -0.5) * CFrame.Angles(math.rad(-4), 0, 0),\
				[\"lbw\"] = CFrame.new(-0.5, 0.5, -0.5) * CFrame.Angles(math.rad(-4), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -0.91, -0.92) * CFrame.Angles(math.rad(-80.23), math.rad(0), math.rad(179.98)) + Vector3.new(0, -0.5, 0);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-112.86), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(--[[0.03]] -0.36, -1.02--[[-1.07]], -0.35) * CFrame.fromOrientation(-math.rad(169.33), math.rad(48.17 + 90), -math.rad(-72.8)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
				[\"Right Shoulder\"] = CFrame.new(1.08, 0.2, -0.15) * CFrame.Angles(math.rad(-4.28), math.rad(57.06), math.rad(-12.88)) - Vector3.new(0, 0.23, 0);\
				[\"Right Hip\"] = CFrame.new(0.36, -1.02, -0.35 --[[-0.54]]) * CFrame.fromOrientation(-math.rad(169.81), math.rad(-38.46 - 90), -math.rad(79.57)) * CFrame.new(0, 0, 1) * CFrame.Angles(0, 0, -math.rad(80)) + Vector3.new(0, 0.6, -0.25);\
				[\"Left Shoulder\"] = CFrame.new(-0.77, 0.26, -0.11) * CFrame.Angles(math.rad(-6.5), math.rad(-55.65), math.rad(-0.57)) - Vector3.new(0, 0.23, 0);\
			}\
		}\
	},\
	\
	cy = {\
		m_neck_delay = 1,\
		m_hip_delay = 0,\
		m_shoulder_delay = 0.5,\
		f_neck_delay = 0.5,\
		f_hip_delay = 0.5,\
		f_shoulder_delay = 0,\
		m_delay = 0,\
		f_delay = 0.5,\
		default = 10,\
		sfx = 5.8,\
		fortnite = CFrame.Angles(math.rad(30), 0, 0),\
		offset = CFrame.new(0, 0.6, -1), --CFrame.new(0, 0.3, -1),\
		shield_offset = CFrame.new(0,0,0),\
		rshield_offset = CFrame.new(0.5,0.5,-0.5),\
		lshield_offset = CFrame.new(-0.5,0.5,-0.5),\
		bw_delay = -1,\
		c_offset = CFrame.new(0.7, -1.4, -0.7) * CFrame.Angles(math.rad(-28), math.pi/2 + math.rad(40), 0),\
		f_when_done = true,\
		transparent = false,\
		t_transparent = false, --true,\
		cumshot = true,\
		f_done = {\
			[\"RootJoint\"] = CFrame.new(0.02, -0.07, -0.73) * CFrame.Angles(math.rad(-119.51), math.rad(0.77), math.rad(-1.36));\
			[\"Left Shoulder\"] = CFrame.new(-1.07, 0.35, -0.25) * CFrame.Angles(math.rad(-136.29), math.rad(-64.22), math.rad(152.66));\
			[\"Right Hip\"] = CFrame.new(0.84, -1.13, 0.32) * CFrame.Angles(math.rad(37.25), math.rad(33.65), math.rad(31.86));\
			[\"Right Shoulder\"] = CFrame.new(1.11, 0.41, -0.18) * CFrame.Angles(math.rad(-154.27), math.rad(60.38), math.rad(-141.88));\
			[\"Left Hip\"] = CFrame.new(-0.95, -1.17, 0.4) * CFrame.Angles(math.rad(46.36), math.rad(-37.37), math.rad(-23.69));\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-79.45), math.rad(0), math.rad(179.98));\
		},\
		m_done = {\
			--[\"fw\"] = CFrame.Angles(math.rad(-12), 0, 0) * CFrame.new(0, 0, 0.3) - Vector3.new(0,0.35, 0),\
			[\"fw\"] = CFrame.Angles(math.rad(25), 0, 0),\
			[\"RootJoint\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-77.2), math.rad(-0.01), math.rad(179.98));\
			[\"Left Shoulder\"] = CFrame.new(-1.12, 0.21, -0.48) * CFrame.Angles(math.rad(29.4), math.rad(-64.09), math.rad(22.11));\
			[\"Right Hip\"] = CFrame.new(1, -1.04, 0.01) * CFrame.Angles(math.rad(-32.09), math.rad(77.65), math.rad(12.73));\
			[\"Right Shoulder\"] = CFrame.new(1, 0.4, -0.21) * CFrame.Angles(math.rad(18.51), math.rad(54.36), math.rad(13.01));\
			[\"Left Hip\"] = CFrame.new(-1, -1.04, 0.01) * CFrame.Angles(math.rad(-43.42), math.rad(-78.08), math.rad(-24.08));\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-104.34), math.rad(0.01), math.rad(179.98));\
		},\
		m = {\
			{\
				--[\"fw\"] = CFrame.Angles(math.rad(5), 0, 0) * CFrame.new(0, 0, 0.1) - Vector3.new(0,0.35, 0),\
				[\"fw\"] = CFrame.Angles(math.rad(30), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-97.85), math.rad(0), math.rad(179.98));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-111), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-43.42), math.rad(-78.08), math.rad(-52.49));\
				[\"Right Shoulder\"] = CFrame.new(1, 0.42, -0.2) * CFrame.Angles(math.rad(27.89), math.rad(52.85), math.rad(16.2));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-32.09), math.rad(77.65), math.rad(41.14));\
				[\"Left Shoulder\"] = CFrame.new(-1.13, 0.3, -0.45) * CFrame.Angles(math.rad(36.15), math.rad(-62.98), math.rad(13.62));\
			};\
			{\
				--[\"fw\"] = CFrame.Angles(math.rad(-12), 0, 0) * CFrame.new(0, 0, 0) - Vector3.new(0,0.35, 0),\
				[\"fw\"] = CFrame.Angles(math.rad(25), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(-82.85), math.rad(0), math.rad(179.98));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-121.98), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1.04, 0.01) * CFrame.Angles(math.rad(-43.42), math.rad(-78.08), math.rad(-29.24));\
				[\"Right Shoulder\"] = CFrame.new(1, 0.4, -0.21) * CFrame.Angles(math.rad(18.51), math.rad(54.36), math.rad(13.01));\
				[\"Right Hip\"] = CFrame.new(1, -1.04, 0.01) * CFrame.Angles(math.rad(-32.09), math.rad(77.65), math.rad(17.89));\
				[\"Left Shoulder\"] = CFrame.new(-1.12, 0.21, -0.48) * CFrame.Angles(math.rad(29.4), math.rad(-64.09), math.rad(22.11));\
			};\
		},\
		f = {\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(6), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0.02, -0.05, -0.87) * CFrame.Angles(math.rad(-114), math.rad(0.64), math.rad(-1.43));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-121.13), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-0.95, -1.17, 0.4) * CFrame.Angles(math.rad(52.81), math.rad(-39.8), math.rad(-20.67));\
				[\"Right Shoulder\"] = CFrame.new(1.11, 0.41, -0.18) * CFrame.Angles(math.rad(-154.27), math.rad(60.38), math.rad(-142.88));\
				[\"Right Hip\"] = CFrame.new(0.84, -1.13, 0.32) * CFrame.Angles(math.rad(39.01), math.rad(34.49), math.rad(31.46));\
				[\"Left Shoulder\"] = CFrame.new(-1.07, 0.35, -0.25) * CFrame.Angles(math.rad(-136.29), math.rad(-64.22), math.rad(153.66));\
			};\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0),\
				[\"RootJoint\"] = CFrame.new(0.02, -0.07, -0.73) * CFrame.Angles(math.rad(-111.46), math.rad(0.57), math.rad(-1.46));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-105.9), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-0.95, -1.17, 0.4) * CFrame.Angles(math.rad(54.61), math.rad(-40.38), math.rad(-22.49));\
				[\"Right Shoulder\"] = CFrame.new(1.11, 0.41, -0.18) * CFrame.Angles(math.rad(-154.27), math.rad(60.38), math.rad(-138.32));\
				[\"Right Hip\"] = CFrame.new(0.84, -1.13, 0.32) * CFrame.Angles(math.rad(43.61), math.rad(37), math.rad(30.96));\
				[\"Left Shoulder\"] = CFrame.new(-1.07, 0.35, -0.25) * CFrame.Angles(math.rad(-136.29), math.rad(-64.22), math.rad(149.1));\
			};\
		}\
	},\
	dg = {\
		m_neck_delay = 1,\
		m_hip_delay = 0,\
		m_shoulder_delay = 0,\
		f_neck_delay = 0.5,\
		f_hip_delay = 0,\
		f_shoulder_delay = 0,\
		m_delay = 0,\
		f_delay = 0,\
		default = 10,\
		sfx = 5.8,\
		fortnite = CFrame.Angles(math.rad(-25), 0, 0),\
		offset =  CFrame.new(0, 0.1, -1.5),\
		shield_offset = CFrame.new(0,0,0),\
		rshield_offset = CFrame.new(0.5,0.5,-0.5),\
		lshield_offset = CFrame.new(-0.5,0.5,-0.5),\
		bw_delay = -1,\
		c_offset = CFrame.new(0, -1, -1.9) * CFrame.Angles(math.pi + math.rad(20),0,0),\
		f_when_done = true,\
		transparent = false,\
		t_transparent = false,\
		cumshot = true,\
		f_done = {\
			[\"RootJoint\"] = CFrame.new(0, -1.79, -1.78) * CFrame.Angles(math.rad(165.09), math.rad(0.02), math.rad(-179.99));\
			[\"Neck\"] = CFrame.new(0, 0.93, 0.22) * CFrame.Angles(math.rad(25.74), math.rad(-0.02), math.rad(-179.99));\
			[\"Left Hip\"] = CFrame.new(-1.11, -1.29, 0.17) * CFrame.Angles(math.rad(18.95), math.rad(-68.12), math.rad(-82.48));\
			[\"Right Shoulder\"] = CFrame.new(0.98, 0.99, -0.65) * CFrame.Angles(math.rad(-63.63), math.rad(34.99), math.rad(-95.61));\
			[\"Right Hip\"] = CFrame.new(1.14, -1.13, 0.24) * CFrame.Angles(math.rad(2.7), math.rad(72.85), math.rad(95.72));\
			[\"Left Shoulder\"] = CFrame.new(-0.98, 0.93, -0.56) * CFrame.Angles(math.rad(-73.43), math.rad(-30.77), math.rad(86.5));\
		},\
		m_done = {\
			[\"fw\"] = CFrame.Angles(math.rad(-26), 0, 0) * CFrame.new(0, 0, 0.2) - Vector3.new(0,0.35, 0),\
			[\"RootJoint\"] = CFrame.new(0, -0.1, -1.18) * CFrame.Angles(math.rad(-82.27), math.rad(0), math.rad(179.98));\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-88.04), math.rad(0), math.rad(179.98));\
			[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-26.35), math.rad(-78.53), math.rad(-5.69));\
			[\"Right Shoulder\"] = CFrame.new(0.85, 0.13, -0.51) * CFrame.Angles(math.rad(-171.33), math.rad(70.91), math.rad(-154.89));\
			[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-10.52), math.rad(80.89), math.rad(-10.17));\
			[\"Left Shoulder\"] = CFrame.new(-0.89, -0.05, -0.38) * CFrame.Angles(math.rad(-180), math.rad(-66.02), math.rad(139.25));\
		},\
		m = {\
			{\
				--[\"fw\"] = CFrame.Angles(math.rad(30), 0, 0)[[ * CFrame.new(0, 0, 0.1)]] - Vector3.new(0, 0.35, 0) + Vector3.new(0, 0, .2),\
			    [\"fw\"] = CFrame.Angles(math.rad(50), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -0.1, -1.04) * CFrame.Angles(math.rad(-102.37 - 30), math.rad(0), math.rad(179.98)) - Vector3.new(0, 0.2, 0.1);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-101.38), math.rad(0), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-26.35), math.rad(-78.53), math.rad(-37.75 - 45));\
				[\"Right Shoulder\"] = CFrame.new(0.85, 0.13, -0.51) * CFrame.Angles(math.rad(-171.33), math.rad(70.91), math.rad(-133.66 + 30));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-10.52), math.rad(80.89), math.rad(21.9 + 45));\
				[\"Left Shoulder\"] = CFrame.new(-0.89, -0.05, -0.38) * CFrame.Angles(math.rad(-180), math.rad(-66.02), math.rad(118.02 - 30));\
			};\
			{\
				--[\"fw\"] = CFrame.Angles(math.rad(-14 - 10), 0, 0)--[[ * CFrame.new(0, 0, 0)]] - Vector3.new(0, 0.35, 0),\
				[\"fw\"] = CFrame.Angles(math.rad(-20), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -0.1, -1.18) * CFrame.Angles(math.rad(-94.85 + 5), math.rad(0), math.rad(179.98)) + Vector3.new(0, 0.1, 0.05);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-98.21), math.rad(0), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-26.35), math.rad(-78.53), math.rad(-23.47 + 5));\
				[\"Right Shoulder\"] = CFrame.new(0.85, 0.13, -0.51) * CFrame.Angles(math.rad(-171.33), math.rad(70.91), math.rad(-145.75 - 30));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-10.52), math.rad(80.89), math.rad(7.61 - 5));\
				[\"Left Shoulder\"] = CFrame.new(-0.89, -0.05, -0.38) * CFrame.Angles(math.rad(-180), math.rad(-66.02), math.rad(130.1 + 30));\
			};\
		},\
		f = {\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(12), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -1.82, -1.65) * CFrame.Angles(math.rad(144.84), math.rad(0.02), math.rad(-179.99)) - Vector3.new(0, 0, 0.2);\
				[\"Neck\"] = CFrame.new(0, 0.93, 0.22) * CFrame.Angles(math.rad(18.4), math.rad(-0.02), math.rad(-179.99));\
				[\"Left Hip\"] = CFrame.new(-1.11, -1.29, 0.17) * CFrame.Angles(math.rad(18.95), math.rad(-68.12), math.rad(-109.58 + 5));\
				[\"Right Shoulder\"] = CFrame.new(1.01, 0.78, -0.35) * CFrame.Angles(math.rad(-64.92), math.rad(31.32), math.rad(-83.75 + 5))- Vector3.new(0, -0.4, 0);\
				[\"Right Hip\"] = CFrame.new(1.14, -1.13, 0.24) * CFrame.Angles(math.rad(2.7), math.rad(72.85), math.rad(122.82 - 5));\
				[\"Left Shoulder\"] = CFrame.new(-1.03, 0.76, -0.24) * CFrame.Angles(math.rad(-68.98), math.rad(-27.25), math.rad(81.99 - 5))- Vector3.new(0, -0.4, 0);\
			};\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -1.79, -1.78) * CFrame.Angles(math.rad(148.72), math.rad(0.02), math.rad(-179.99)) + Vector3.new(0, 0, 0.3);\
				[\"Neck\"] = CFrame.new(0, 0.93, 0.22) * CFrame.Angles(math.rad(25.74), math.rad(-0.02), math.rad(-179.99));\
				[\"Left Hip\"] = CFrame.new(-1.11, -1.29, 0.17) * CFrame.Angles(math.rad(18.95), math.rad(-68.12), math.rad(-103.02 - 10));\
				[\"Right Shoulder\"] = CFrame.new(1.01, 0.78, -0.35) * CFrame.Angles(math.rad(-64.92), math.rad(31.32), math.rad(-83.75 - 10))- Vector3.new(0, -0.55, 0);\
				[\"Right Hip\"] = CFrame.new(1.14, -1.13, 0.24) * CFrame.Angles(math.rad(2.7), math.rad(72.85), math.rad(116.27 + 10));\
				[\"Left Shoulder\"] = CFrame.new(-1.03, 0.76, -0.24) * CFrame.Angles(math.rad(-68.98), math.rad(-27.25), math.rad(81.99 + 10)) - Vector3.new(0, -0.55, 0);\
			};\
		}\
	},\
	dga = {\
		m_neck_delay = 1,\
		m_hip_delay = 0,\
		m_shoulder_delay = 0,\
		f_neck_delay = 0.5,\
		f_hip_delay = 0,\
		f_shoulder_delay = 0,\
		m_delay = 0,\
		f_delay = 0,\
		default = 10,\
		sfx = 5.8,\
		fortnite = CFrame.Angles(math.rad(5), 0, 0),\
		offset =  CFrame.new(0, 0.1, -1.5),\
		shield_offset = CFrame.new(0,0,0),\
		rshield_offset = CFrame.new(0.5,0.5,-0.5),\
		lshield_offset = CFrame.new(-0.5,0.5,-0.5),\
		bw_delay = -1,\
		c_offset = CFrame.new(0, -1, -1.9) * CFrame.Angles(math.pi + math.rad(20),0,0),\
		f_when_done = true,\
		transparent = false,\
		t_transparent = false,\
		cumshot = true,\
		anal = true,\
		f_done = {\
			[\"RootJoint\"] = CFrame.new(0, -1.79, -1.78) * CFrame.Angles(math.rad(165.09 + 17), math.rad(0.02), math.rad(-179.99));\
			[\"Neck\"] = CFrame.new(0, 0.93, 0.22) * CFrame.Angles(math.rad(25.74), math.rad(-0.02), math.rad(-179.99));\
			[\"Left Hip\"] = CFrame.new(-1.11, -1.29, 0.17) * CFrame.Angles(math.rad(18.95 - 7), math.rad(-68.12), math.rad(-82.48));\
			[\"Right Shoulder\"] = CFrame.new(0.98, 0.99, -0.65) * CFrame.Angles(math.rad(-63.63), math.rad(34.99), math.rad(-95.61));\
			[\"Right Hip\"] = CFrame.new(1.14, -1.13, 0.24) * CFrame.Angles(math.rad(2.7 + 7), math.rad(72.85), math.rad(95.72));\
			[\"Left Shoulder\"] = CFrame.new(-0.98, 0.93, -0.56) * CFrame.Angles(math.rad(-73.43), math.rad(-30.77), math.rad(86.5));\
		},\
		m_done = {\
			[\"fw\"] = CFrame.Angles(math.rad(-26), 0, 0),-- * CFrame.new(0, 0, 0.2) - Vector3.new(0,0.35, 0),\
			[\"RootJoint\"] = CFrame.new(0, -0.1, -1.18) * CFrame.Angles(math.rad(-82.27), math.rad(0), math.rad(179.98));\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-88.04), math.rad(0), math.rad(179.98));\
			[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-26.35), math.rad(-78.53), math.rad(-5.69));\
			[\"Right Shoulder\"] = CFrame.new(0.85, 0.13, -0.51) * CFrame.Angles(math.rad(-171.33), math.rad(70.91), math.rad(-154.89));\
			[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-10.52), math.rad(80.89), math.rad(-10.17));\
			[\"Left Shoulder\"] = CFrame.new(-0.89, -0.05, -0.38) * CFrame.Angles(math.rad(-180), math.rad(-66.02), math.rad(139.25));\
		},\
		m = {\
			{\
				--[\"fw\"] = CFrame.Angles(math.rad(30), 0, 0)--[[ * CFrame.new(0, 0, 0.1)]] - Vector3.new(0, 0.35, 0) + Vector3.new(0, 0, .2),\
				[\"fw\"] = CFrame.Angles(math.rad(50), 0, 0),-- * CFrame.new(0, 0, 0.1) - Vector3.new(0, 0.35, 0) + Vector3.new(0, 0, .2),\
				[\"RootJoint\"] = CFrame.new(0, -0.1, -1.04) * CFrame.Angles(math.rad(-102.37 - 30), math.rad(0), math.rad(179.98)) - Vector3.new(0, 0.2, 0.1);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-101.38), math.rad(0), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-26.35), math.rad(-78.53), math.rad(-37.75 - 45));\
				[\"Right Shoulder\"] = CFrame.new(0.85, 0.13, -0.51) * CFrame.Angles(math.rad(-171.33), math.rad(70.91), math.rad(-133.66 + 30));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-10.52), math.rad(80.89), math.rad(21.9 + 45));\
				[\"Left Shoulder\"] = CFrame.new(-0.89, -0.05, -0.38) * CFrame.Angles(math.rad(-180), math.rad(-66.02), math.rad(118.02 - 30));\
			};\
			{\
				--[\"fw\"] = CFrame.Angles(math.rad(-14 - 10), 0, 0)--[[ * CFrame.new(0, 0, 0)]] - Vector3.new(0, 0.35, 0),\
				[\"fw\"] = CFrame.Angles(math.rad(-14 - 10), 0, 0),-- * CFrame.new(0, 0, 0) - Vector3.new(0, 0.35, 0),\
				[\"RootJoint\"] = CFrame.new(0, -0.1, -1.18) * CFrame.Angles(math.rad(-94.85 + 5), math.rad(0), math.rad(179.98)) + Vector3.new(0, 0.1, 0.05);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-98.21), math.rad(0), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-26.35), math.rad(-78.53), math.rad(-23.47 + 5));\
				[\"Right Shoulder\"] = CFrame.new(0.85, 0.13, -0.51) * CFrame.Angles(math.rad(-171.33), math.rad(70.91), math.rad(-145.75 - 30));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-10.52), math.rad(80.89), math.rad(7.61 - 5));\
				[\"Left Shoulder\"] = CFrame.new(-0.89, -0.05, -0.38) * CFrame.Angles(math.rad(-180), math.rad(-66.02), math.rad(130.1 + 30));\
			};\
		},\
		f = {\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(12), 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -1.82, -1.65) * CFrame.Angles(math.rad(144.84 + 17), math.rad(0.02), math.rad(-179.99)) - Vector3.new(0, 0, 0.2);\
				[\"Neck\"] = CFrame.new(0, 0.93, 0.22) * CFrame.Angles(math.rad(18.4), math.rad(-0.02), math.rad(-179.99));\
				[\"Left Hip\"] = CFrame.new(-1.11, -1.29, 0.17) * CFrame.Angles(math.rad(18.95), math.rad(-68.12 - 7), math.rad(-109.58 + 5));\
				[\"Right Shoulder\"] = CFrame.new(1.01, 0.78, -0.35) * CFrame.Angles(math.rad(-64.92), math.rad(31.32), math.rad(-83.75 + 5))- Vector3.new(0, -0.4, 0);\
				[\"Right Hip\"] = CFrame.new(1.14, -1.13, 0.24) * CFrame.Angles(math.rad(2.7), math.rad(72.85 + 7), math.rad(122.82 - 5));\
				[\"Left Shoulder\"] = CFrame.new(-1.03, 0.76, -0.24) * CFrame.Angles(math.rad(-68.98), math.rad(-27.25), math.rad(81.99 - 5))- Vector3.new(0, -0.4, 0);\
			};\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0),\
				[\"RootJoint\"] = CFrame.new(0, -1.79, -1.78) * CFrame.Angles(math.rad(148.72 + 17), math.rad(0.02), math.rad(-179.99)) + Vector3.new(0, 0, 0.3);\
				[\"Neck\"] = CFrame.new(0, 0.93, 0.22) * CFrame.Angles(math.rad(25.74), math.rad(-0.02), math.rad(-179.99));\
				[\"Left Hip\"] = CFrame.new(-1.11, -1.29, 0.17) * CFrame.Angles(math.rad(18.95), math.rad(-68.12 - 7), math.rad(-103.02 - 10));\
				[\"Right Shoulder\"] = CFrame.new(1.01, 0.78, -0.35) * CFrame.Angles(math.rad(-64.92), math.rad(31.32), math.rad(-83.75 - 10))- Vector3.new(0, -0.55, 0);\
				[\"Right Hip\"] = CFrame.new(1.14, -1.13, 0.24) * CFrame.Angles(math.rad(2.7), math.rad(72.85 + 7), math.rad(116.27 + 10));\
				[\"Left Shoulder\"] = CFrame.new(-1.03, 0.76, -0.24) * CFrame.Angles(math.rad(-68.98), math.rad(-27.25), math.rad(81.99 + 10)) - Vector3.new(0, -0.55, 0);\
			};\
		}\
	},\
	bj = {\
		m_neck_delay = 1,\
		m_hip_delay = 0,\
		m_shoulder_delay = 0.5,\
		f_neck_delay = 1,\
		f_hip_delay = 0.3,\
		f_shoulder_delay = 0.3,\
		m_delay = 0,\
		f_delay = 0.3,\
		default = 10,\
		sfx = 5.8,\
		fortnite = CFrame.Angles(math.rad(35), 0, 0), --CFrame.Angles(math.rad(5), 0, 0) - Vector3.new(0,0.05,0), --CFrame.Angles(math.rad(-15), 0, 0),\
		offset =  CFrame.new(0, 0, -1),\
		shield_offset = CFrame.new(0,0,0),\
		rshield_offset = CFrame.new(0.5,0.5,-0.5),\
		lshield_offset = CFrame.new(-0.5,0.5,-0.5),\
		bw_delay = -1,\
		c_offset = CFrame.new(0, -1, -1.9) * CFrame.Angles(math.pi + math.rad(20),0,0),\
		f_when_done = true,\
		transparent = false,\
		t_transparent = false, --true,\
		head = true,\
		cumshot = true,\
		f_done = {\
			--[\"Left Hip\"] = CFrame.new(-0.97, -0.43, -0.89) * CFrame.Angles(math.rad(178.89), math.rad(-81.11), math.rad(-112.34));\
			--[\"Right Hip\"] = CFrame.new(0.98, -0.45, -0.95) * CFrame.Angles(math.rad(178.63), math.rad(83.26), math.rad(111.54));\
			--[\"RootJoint\"] = CFrame.new(0.08, -1.82, -1.42) * CFrame.Angles(math.rad(-70.73), math.rad(-1.13), math.rad(-3.22)) * CFrame.new(0, -0.2, 0);\
			[\"Left Hip\"] = CFrame.new(-0.97, -0.43, -0.89) * CFrame.Angles(math.rad(178.89), math.rad(-81.11), math.rad(-112.34)) + Vector3.new(0,-0.5,0.5);\
			[\"Right Hip\"] = CFrame.new(0.98, -0.45, -0.95) * CFrame.Angles(math.rad(178.63), math.rad(83.26), math.rad(111.54)) + Vector3.new(0,-0.5,0.5);\
			[\"RootJoint\"] = CFrame.new(0.08, -1.32, -1.42) * CFrame.Angles(math.rad(-70.73), math.rad(-1.13), math.rad(-3.22)) * CFrame.new(0, -0.2, 0);\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-127.06), math.rad(0.01), math.rad(179.98)) * CFrame.Angles(math.rad(-20),0 ,0);\
			[\"Right Shoulder\"] = CFrame.new(1, 0.5, 0) * CFrame.Angles(math.rad(-160.5), math.rad(67.38), math.rad(-94.87));\
			[\"Left Shoulder\"] = CFrame.new(-1, 0.5, 0) * CFrame.Angles(math.rad(-166.38), math.rad(-69.71), math.rad(93.9));\
		},\
		m_done = {\
			--[\"fw\"] = CFrame.Angles(math.rad(-8), 0, 0) * CFrame.new(0, 0, 0.3) - Vector3.new(0,0.55, 0),\
			[\"fw\"] = CFrame.Angles(math.rad(35), 0, 0),\
			[\"RootJoint\"] = CFrame.new(0, -0.02, -0.33) * CFrame.Angles(math.rad(-77.49), math.rad(-0.01), math.rad(179.98));\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-101.56), math.rad(0), math.rad(179.98));\
			[\"Left Hip\"] = CFrame.new(-1.12, -0.99, 0.03) * CFrame.Angles(math.rad(-14.85), math.rad(-74.68), math.rad(6.3));\
			[\"Right Shoulder\"] = CFrame.new(0.73, 0.59, -0.32) * CFrame.Angles(math.rad(141.9), math.rad(49.34), math.rad(-94.92));\
			[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-9.97), math.rad(78.92), math.rad(-5.75));\
			[\"Left Shoulder\"] = CFrame.new(-0.9, 0.3, -0.2) * CFrame.Angles(math.rad(179.13), math.rad(-48.77), math.rad(138.97));\
		},\
		m = {\
			{\
				[\"RootJoint\"] = CFrame.new(0, -0.02, -0.33) * CFrame.Angles(math.rad(-87.05), math.rad(0), math.rad(179.98));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-118.63), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1.12, -0.99, 0.03) * CFrame.Angles(math.rad(-14.85), math.rad(-74.68), math.rad(-6.59));\
				[\"Right Shoulder\"] = CFrame.new(0.73, 0.59, -0.32) * CFrame.Angles(math.rad(141.9), math.rad(49.34), math.rad(-66.18));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-9.97), math.rad(78.92), math.rad(7.14));\
				[\"Left Shoulder\"] = CFrame.new(-0.9, 0.3, -0.2) * CFrame.Angles(math.rad(-178), math.rad(-51.31), math.rad(127.08));\
			};\
			{\
				[\"RootJoint\"] = CFrame.new(0, -0.02, -0.33) * CFrame.Angles(math.rad(-83.89), math.rad(0), math.rad(179.98));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-123.65), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1.12, -0.99, 0.03) * CFrame.Angles(math.rad(-14.85), math.rad(-74.68), math.rad(-2.5));\
				[\"Right Shoulder\"] = CFrame.new(0.73, 0.59, -0.32) * CFrame.Angles(math.rad(141.9), math.rad(49.34), math.rad(-74.17));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-9.97), math.rad(78.92), math.rad(3.05));\
				[\"Left Shoulder\"] = CFrame.new(-0.9, 0.3, -0.2) * CFrame.Angles(math.rad(179.13), math.rad(-48.77), math.rad(131.38));\
			};\
		},\
		f = {\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0) * CFrame.Angles(math.rad(7), 0, 0),\
				--[\"RootJoint\"] = CFrame.new(0.08, -1.82, -1.42) * CFrame.Angles(math.rad(-72.84), math.rad(-1.01), math.rad(-3.26));\
				[\"RootJoint\"] = CFrame.new(0.08, -1.32, -1.42) * CFrame.Angles(math.rad(-72.84), math.rad(-1.01), math.rad(-3.26));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-91.23), math.rad(0), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-0.97, -0.48, -0.91) * CFrame.Angles(math.rad(178.89), math.rad(-81.11), math.rad(-108.78)) + Vector3.new(0,-0.5,0.5);\
				[\"Right Shoulder\"] = CFrame.new(1, 0.5, 0) * CFrame.Angles(math.rad(-160.5), math.rad(67.38), math.rad(-94.08));\
				[\"Right Hip\"] = CFrame.new(0.98, -0.49, -0.97) * CFrame.Angles(math.rad(178.63), math.rad(83.26), math.rad(107.97)) + Vector3.new(0,-0.5,0.5);\
				[\"Left Shoulder\"] = CFrame.new(-1, 0.5, 0) * CFrame.Angles(math.rad(-166.38), math.rad(-69.71), math.rad(93.11));\
			};\
			{\
				[\"bw\"] = CFrame.new(0, 0, 0),\
				[\"RootJoint\"] = CFrame.new(0.08, -1.32, -1.42) * CFrame.Angles(math.rad(-68.45), math.rad(-1.26), math.rad(-3.17));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-98.86), math.rad(0), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-0.97, -0.43, -0.89) * CFrame.Angles(math.rad(178.89), math.rad(-81.11), math.rad(-112.34)) + Vector3.new(0,-0.5,0.5);\
				[\"Right Shoulder\"] = CFrame.new(1, 0.5, 0) * CFrame.Angles(math.rad(-160.5), math.rad(67.38), math.rad(-88.71));\
				[\"Right Hip\"] = CFrame.new(0.98, -0.45, -0.95) * CFrame.Angles(math.rad(178.63), math.rad(83.26), math.rad(111.54)) + Vector3.new(0,-0.5,0.5);\
				[\"Left Shoulder\"] = CFrame.new(-1, 0.5, 0) * CFrame.Angles(math.rad(-166.38), math.rad(-69.71), math.rad(87.74));\
			};\
		}\
	},\
	bbj = {\
		m_neck_delay = 1,\
		m_hip_delay = 0,\
		m_shoulder_delay = 0.5,\
		f_neck_delay = 1,\
		f_hip_delay = 0.3,\
		f_shoulder_delay = 0.3,\
		m_delay = 0,\
		f_delay = 0.3,\
		default = 10,\
		sfx = 5.8,\
		fortnite = CFrame.Angles(0, 0, 0), --CFrame.new(0,-0.25,0) * CFrame.Angles(0, 0, 0),\
		offset = CFrame.new(0, 0, -1.2), --CFrame.new(0, 0, -1.1), -- -0.8\
		shield_offset = CFrame.new(0,0,0),\
		rshield_offset = CFrame.new(0.5,0.5,-0.5),\
		lshield_offset = CFrame.new(-0.5,0.5,-0.5),\
		bw_delay = -0.4,\
		c_offset = CFrame.new(0, -1, -1.9) * CFrame.Angles(math.pi + math.rad(20),0,0),\
		f_when_done = true,\
		transparent = false,\
		t_transparent = false,\
		b = true,\
		cumshot = true,\
		f_done = {\
			[\"RootJoint\"] = CFrame.new(0.03, -1.23, -0.45) * CFrame.Angles(math.rad(-75), 0, 0);\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-107.83), math.rad(0.01), math.rad(179.98));\
			[\"Left Hip\"] = CFrame.new(-1, -1.11, -0.02) * CFrame.Angles(math.rad(-164.61), math.rad(-78.47), math.rad(-95.49));\
			[\"Right Shoulder\"] = CFrame.new(1.1, -0.08, 0.3) * CFrame.Angles(math.rad(164.51), math.rad(61.99), math.rad(-58.68));\
			[\"Right Hip\"] = CFrame.new(1, -1.32, -0.07) * CFrame.Angles(math.rad(-168.64), math.rad(76.9), math.rad(95.49));\
			[\"Left Shoulder\"] = CFrame.new(-1.03, -0.37, 0.36) * CFrame.Angles(math.rad(174.09), math.rad(-56.63), math.rad(57.57));\
		},\
		m_done = {\
			[\"fw\"] = CFrame.Angles(math.rad(3), 0, 0),-- - Vector3.new(0, 0.25, -0.1),\
			[\"RootJoint\"] = CFrame.new(0, -2.44, 0.02) * CFrame.Angles(math.rad(-2.87), math.rad(-0.02), math.rad(180));\
			[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-114.61), math.rad(0.01), math.rad(179.98));\
			[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-80.29), math.rad(-44.17), math.rad(-83.18));\
			[\"Right Shoulder\"] = CFrame.new(1.12, 0.79, 0) * CFrame.Angles(math.rad(-70.49), math.rad(21.15), math.rad(-94.77));\
			[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-85.21), math.rad(38.05), math.rad(86.74));\
			[\"Left Shoulder\"] = CFrame.new(-0.9, 0.93, 0) * CFrame.Angles(math.rad(-67.12), math.rad(-37.27), math.rad(102.65));\
		},\
		m = {\
			{\
				[\"fw\"] = CFrame.Angles(0, 0, 0),-- - Vector3.new(0, 0.25, -0.1),\
				[\"RootJoint\"] = CFrame.new(0, -2.44, 0.02) * CFrame.Angles(math.rad(-0.42), math.rad(-0.02), math.rad(180));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-116.81), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-80.29), math.rad(-44.17), math.rad(-79.04));\
				[\"Right Shoulder\"] = CFrame.new(1.12, 0.79, 0) * CFrame.Angles(math.rad(-70.49), math.rad(21.15), math.rad(-96.75));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-85.21), math.rad(38.05), math.rad(84.39));\
				[\"Left Shoulder\"] = CFrame.new(-0.9, 0.93, 0) * CFrame.Angles(math.rad(-67.12), math.rad(-37.27), math.rad(104.63));\
			};\
			{\
				[\"fw\"] = CFrame.Angles(math.rad(5), 0, 0),-- - Vector3.new(0, 0.25, -0.1),\
				[\"RootJoint\"] = CFrame.new(0, -2.44, 0.02) * CFrame.Angles(math.rad(-2.87), math.rad(-0.02), math.rad(180));\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-114.61), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1, 0) * CFrame.Angles(math.rad(-80.29), math.rad(-44.17), math.rad(-83.18));\
				[\"Right Shoulder\"] = CFrame.new(1.12, 0.79, 0) * CFrame.Angles(math.rad(-70.49), math.rad(21.15), math.rad(-94.77));\
				[\"Right Hip\"] = CFrame.new(1, -1, 0) * CFrame.Angles(math.rad(-85.21), math.rad(38.05), math.rad(86.74));\
				[\"Left Shoulder\"] = CFrame.new(-0.9, 0.93, 0) * CFrame.Angles(math.rad(-67.12), math.rad(-37.27), math.rad(102.65));\
			};\
		},\
		f = {\
			{\
				--[\"bw\"] = CFrame.new(0, 0.2, 0) * CFrame.Angles(math.rad(13), 0, 0),\
				[\"rbw\"] = CFrame.new(0.5, 0.5, -0.5) * CFrame.Angles(math.rad(50), 0, 0),\
				[\"lbw\"] = CFrame.new(-0.5, 0.5, -0.5) * CFrame.Angles(math.rad(50), 0, 0),\
				--[\"RootJoint\"] = CFrame.new(0.03, -1.23, -0.45) * CFrame.Angles(math.rad(-79.86), math.rad(-0.69), math.rad(-3.86));\
				[\"RootJoint\"] = CFrame.new(0.03, -1.23, -0.45) * CFrame.Angles(math.rad(-80), 0, 0);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-102.44), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1.11, -0.02) * CFrame.Angles(math.rad(-164.61), math.rad(-78.47), math.rad(-90.02));\
				[\"Right Shoulder\"] = CFrame.new(1.1, -0.08, 0.3) * CFrame.Angles(math.rad(164.51), math.rad(61.99), math.rad(-50.87));\
				[\"Right Hip\"] = CFrame.new(1, -1.32, -0.07) * CFrame.Angles(math.rad(-168.64), math.rad(76.9), math.rad(90.01));\
				[\"Left Shoulder\"] = CFrame.new(-1.03, -0.37, 0.36) * CFrame.Angles(math.rad(174.09), math.rad(-56.63), math.rad(49.76));\
			};\
			{\
				--[\"bw\"] = CFrame.new(0, -0.1, 0) * CFrame.Angles(math.rad(5), 0, 0),\
				[\"rbw\"] = CFrame.new(0.5, 0.5, -0.5) * CFrame.Angles(math.rad(5), 0, 0),\
				[\"lbw\"] = CFrame.new(-0.5, 0.5, -0.5) * CFrame.Angles(math.rad(5), 0, 0),\
				--[\"RootJoint\"] = CFrame.new(0.03, -1.23, -0.45) * CFrame.Angles(math.rad(-74.04), math.rad(-1.08), math.rad(-3.77));\
				[\"RootJoint\"] = CFrame.new(0.03, -1.23, -0.45) * CFrame.Angles(math.rad(-75), 0, 0);\
				[\"Neck\"] = CFrame.new(0, 1, 0) * CFrame.Angles(math.rad(-107.83), math.rad(0.01), math.rad(179.98));\
				[\"Left Hip\"] = CFrame.new(-1, -1.11, -0.02) * CFrame.Angles(math.rad(-164.61), math.rad(-78.47), math.rad(-95.49));\
				[\"Right Shoulder\"] = CFrame.new(1.1, -0.08, 0.3) * CFrame.Angles(math.rad(164.51), math.rad(61.99), math.rad(-58.68));\
				[\"Right Hip\"] = CFrame.new(1, -1.32, -0.07) * CFrame.Angles(math.rad(-168.64), math.rad(76.9), math.rad(95.49));\
				[\"Left Shoulder\"] = CFrame.new(-1.03, -0.37, 0.36) * CFrame.Angles(math.rad(174.09), math.rad(-56.63), math.rad(57.57));\
			};\
		}\
	}\
\
}"
    obj437534.Parent = obj879504
    local obj582191 = Instance.new("ObjectValue")
    obj582191.Name = "m"
    obj582191.Parent = obj879504
    local obj959759 = Instance.new("ObjectValue")
    obj959759.Name = "f"
    obj959759.Parent = obj879504
    local obj991354 = Instance.new("RemoteEvent")
    obj991354.Name = "input"
    obj991354.Parent = obj879504
    local obj903820 = Instance.new("BoolValue")
    obj903820.Name = "isPriv"
    obj903820.Parent = obj879504
    local obj239059 = Instance.new("EqualizerSoundEffect")
    obj239059.Name = "eq"
    obj239059.Parent = obj879504
    local obj269190 = Instance.new("Model")
    obj269190.Name = "CumShot"
    obj269190.Parent = obj879504
        local obj743731 = Instance.new("Part")
        obj743731.Name = "2"
        obj743731.Size = Vector3.new(0.0010000000474974513, 0.0010000000474974513, 0.0010000000474974513)
        obj743731.Position = Vector3.new(33.45000076293945, 9.100034713745117, 49.724998474121094)
        obj743731.Anchored = true
        obj743731.BrickColor = BrickColor.new("Medium stone grey")
        obj743731.Parent = obj269190
            local obj979947 = Instance.new("Attachment")
            obj979947.Name = "Attachment"
            obj979947.Parent = obj743731
            local obj587280 = Instance.new("SpringConstraint")
            obj587280.Name = "SpringConstraint_Cum"
            obj587280.Parent = obj743731
            local obj662845 = Instance.new("Attachment")
            obj662845.Name = "Attachment"
            obj662845.Parent = obj743731
            local obj853295 = Instance.new("BallSocketConstraint")
            obj853295.Name = "BallSocketConstraint"
            obj853295.Parent = obj743731
        local obj951971 = Instance.new("Part")
        obj951971.Name = "3"
        obj951971.Size = Vector3.new(0.0010000000474974513, 0.0010000000474974513, 0.0010000000474974513)
        obj951971.Position = Vector3.new(33.45000076293945, 9.100034713745117, 49.07500076293945)
        obj951971.Anchored = true
        obj951971.BrickColor = BrickColor.new("Medium stone grey")
        obj951971.Parent = obj269190
            local obj575005 = Instance.new("Attachment")
            obj575005.Name = "Attachment"
            obj575005.Parent = obj951971
            local obj629076 = Instance.new("SpringConstraint")
            obj629076.Name = "SpringConstraint_Cum"
            obj629076.Parent = obj951971
            local obj439539 = Instance.new("Attachment")
            obj439539.Name = "Attachment"
            obj439539.Parent = obj951971
            local obj667527 = Instance.new("BallSocketConstraint")
            obj667527.Name = "BallSocketConstraint"
            obj667527.Parent = obj951971
        local obj664112 = Instance.new("Part")
        obj664112.Name = "4"
        obj664112.Size = Vector3.new(0.0010000000474974513, 0.0010000000474974513, 0.0010000000474974513)
        obj664112.Position = Vector3.new(33.45000076293945, 9.100034713745117, 48.5)
        obj664112.Anchored = true
        obj664112.BrickColor = BrickColor.new("Medium stone grey")
        obj664112.Parent = obj269190
            local obj553790 = Instance.new("Attachment")
            obj553790.Name = "Attachment"
            obj553790.Parent = obj664112
            local obj163603 = Instance.new("SpringConstraint")
            obj163603.Name = "SpringConstraint_Cum"
            obj163603.Parent = obj664112
            local obj263757 = Instance.new("BallSocketConstraint")
            obj263757.Name = "BallSocketConstraint"
            obj263757.Parent = obj664112
            local obj392360 = Instance.new("Attachment")
            obj392360.Name = "Attachment"
            obj392360.Parent = obj664112
        local obj735367 = Instance.new("Part")
        obj735367.Name = "5"
        obj735367.Size = Vector3.new(0.0010000000474974513, 0.0010000000474974513, 0.0010000000474974513)
        obj735367.Position = Vector3.new(33.45000076293945, 9.100034713745117, 48.025001525878906)
        obj735367.Anchored = true
        obj735367.BrickColor = BrickColor.new("Medium stone grey")
        obj735367.Parent = obj269190
            local obj117875 = Instance.new("Attachment")
            obj117875.Name = "Attachment"
            obj117875.Parent = obj735367
        local obj622102 = Instance.new("Part")
        obj622102.Name = "1"
        obj622102.Size = Vector3.new(0.0010000000474974513, 0.0010000000474974513, 0.0010000000474974513)
        obj622102.Position = Vector3.new(33.44999694824219, 9.1000337600708, 50.19999694824219)
        obj622102.Anchored = true
        obj622102.BrickColor = BrickColor.new("Medium stone grey")
        obj622102.Parent = obj269190
            local obj745485 = Instance.new("Attachment")
            obj745485.Name = "Attachment"
            obj745485.Parent = obj622102
            local obj374737 = Instance.new("SpringConstraint")
            obj374737.Name = "SpringConstraint_Cum"
            obj374737.Parent = obj622102
            local obj363422 = Instance.new("BallSocketConstraint")
            obj363422.Name = "BallSocketConstraint"
            obj363422.Parent = obj622102
            local obj669033 = Instance.new("Attachment")
            obj669033.Name = "Attachment"
            obj669033.Parent = obj622102
    local obj807143 = Instance.new("MeshPart")
    obj807143.Name = "Puddle"
    obj807143.Size = Vector3.new(1.7595185041427612, 0.029811369255185127, 1.4268922805786133)
    obj807143.Position = Vector3.new(63.536556243896484, 0.02499997615814209, 108.7202377319336)
    obj807143.Anchored = true
    obj807143.BrickColor = BrickColor.new("Institutional white")
    obj807143.Parent = obj879504
local obj891987 = Instance.new("Model")
obj891987.Name = "hatWearer"
obj891987.Parent = game.ServerStorage
    local obj417911 = Instance.new("Part")
    obj417911.Name = "Head"
    obj417911.Size = Vector3.new(2, 1, 1)
    obj417911.Position = Vector3.new(9.396509170532227, 4.5, -46.2797737121582)
    obj417911.Anchored = false
    obj417911.BrickColor = BrickColor.new("Light grey metallic")
    obj417911.Parent = obj891987
        local obj809655 = Instance.new("SpecialMesh")
        obj809655.Name = "Mesh"
        obj809655.Parent = obj417911
        local obj868922 = Instance.new("Decal")
        obj868922.Name = "face"
        obj868922.Parent = obj417911
        local obj222234 = Instance.new("Attachment")
        obj222234.Name = "HairAttachment"
        obj222234.Parent = obj417911
        local obj212034 = Instance.new("Attachment")
        obj212034.Name = "HatAttachment"
        obj212034.Parent = obj417911
        local obj513851 = Instance.new("Attachment")
        obj513851.Name = "FaceFrontAttachment"
        obj513851.Parent = obj417911
        local obj340682 = Instance.new("Attachment")
        obj340682.Name = "FaceCenterAttachment"
        obj340682.Parent = obj417911
    local obj244194 = Instance.new("Part")
    obj244194.Name = "Torso"
    obj244194.Size = Vector3.new(2, 2, 1)
    obj244194.Position = Vector3.new(9.396509170532227, 3, -46.2797737121582)
    obj244194.Anchored = false
    obj244194.BrickColor = BrickColor.new("Light grey metallic")
    obj244194.Parent = obj891987
        local obj522130 = Instance.new("Decal")
        obj522130.Name = "roblox"
        obj522130.Parent = obj244194
        local obj995900 = Instance.new("Attachment")
        obj995900.Name = "NeckAttachment"
        obj995900.Parent = obj244194
        local obj368952 = Instance.new("Attachment")
        obj368952.Name = "BodyFrontAttachment"
        obj368952.Parent = obj244194
        local obj578036 = Instance.new("Attachment")
        obj578036.Name = "BodyBackAttachment"
        obj578036.Parent = obj244194
        local obj562815 = Instance.new("Attachment")
        obj562815.Name = "LeftCollarAttachment"
        obj562815.Parent = obj244194
        local obj230630 = Instance.new("Attachment")
        obj230630.Name = "RightCollarAttachment"
        obj230630.Parent = obj244194
        local obj372872 = Instance.new("Attachment")
        obj372872.Name = "WaistFrontAttachment"
        obj372872.Parent = obj244194
        local obj234315 = Instance.new("Attachment")
        obj234315.Name = "WaistCenterAttachment"
        obj234315.Parent = obj244194
        local obj246931 = Instance.new("Attachment")
        obj246931.Name = "WaistBackAttachment"
        obj246931.Parent = obj244194
        local obj278852 = Instance.new("Motor6D")
        obj278852.Name = "Right Shoulder"
        obj278852.Parent = obj244194
        local obj895627 = Instance.new("Motor6D")
        obj895627.Name = "Left Shoulder"
        obj895627.Parent = obj244194
        local obj226418 = Instance.new("Motor6D")
        obj226418.Name = "Right Hip"
        obj226418.Parent = obj244194
        local obj718652 = Instance.new("Motor6D")
        obj718652.Name = "Left Hip"
        obj718652.Parent = obj244194
        local obj100085 = Instance.new("Motor6D")
        obj100085.Name = "Neck"
        obj100085.Parent = obj244194
    local obj643171 = Instance.new("Part")
    obj643171.Name = "Left Arm"
    obj643171.Size = Vector3.new(1, 2, 1)
    obj643171.Position = Vector3.new(7.896509170532227, 3, -46.2797737121582)
    obj643171.Anchored = false
    obj643171.BrickColor = BrickColor.new("Light grey metallic")
    obj643171.Parent = obj891987
        local obj225810 = Instance.new("Attachment")
        obj225810.Name = "LeftShoulderAttachment"
        obj225810.Parent = obj643171
        local obj366392 = Instance.new("Attachment")
        obj366392.Name = "LeftGripAttachment"
        obj366392.Parent = obj643171
    local obj296580 = Instance.new("Part")
    obj296580.Name = "Right Arm"
    obj296580.Size = Vector3.new(1, 2, 1)
    obj296580.Position = Vector3.new(10.896509170532227, 3, -46.2797737121582)
    obj296580.Anchored = false
    obj296580.BrickColor = BrickColor.new("Light grey metallic")
    obj296580.Parent = obj891987
        local obj732670 = Instance.new("Attachment")
        obj732670.Name = "RightShoulderAttachment"
        obj732670.Parent = obj296580
        local obj344018 = Instance.new("Attachment")
        obj344018.Name = "RightGripAttachment"
        obj344018.Parent = obj296580
    local obj497747 = Instance.new("Part")
    obj497747.Name = "Left Leg"
    obj497747.Size = Vector3.new(1, 2, 1)
    obj497747.Position = Vector3.new(8.896509170532227, 1, -46.2797737121582)
    obj497747.Anchored = false
    obj497747.BrickColor = BrickColor.new("Light grey metallic")
    obj497747.Parent = obj891987
        local obj827902 = Instance.new("Attachment")
        obj827902.Name = "LeftFootAttachment"
        obj827902.Parent = obj497747
    local obj759321 = Instance.new("Part")
    obj759321.Name = "Right Leg"
    obj759321.Size = Vector3.new(1, 2, 1)
    obj759321.Position = Vector3.new(9.896509170532227, 1, -46.2797737121582)
    obj759321.Anchored = false
    obj759321.BrickColor = BrickColor.new("Light grey metallic")
    obj759321.Parent = obj891987
        local obj942177 = Instance.new("Attachment")
        obj942177.Name = "RightFootAttachment"
        obj942177.Parent = obj759321
    local obj271128 = Instance.new("Humanoid")
    obj271128.Name = "Humanoid"
    obj271128.Parent = obj891987
        local obj571764 = Instance.new("HumanoidDescription")
        obj571764.Name = "HumanoidDescription"
        obj571764.Parent = obj271128
            local obj740908 = Instance.new("BodyPartDescription")
            obj740908.Name = "BodyPartDescription"
            obj740908.Parent = obj571764
            local obj163376 = Instance.new("BodyPartDescription")
            obj163376.Name = "BodyPartDescription"
            obj163376.Parent = obj571764
            local obj216352 = Instance.new("BodyPartDescription")
            obj216352.Name = "BodyPartDescription"
            obj216352.Parent = obj571764
            local obj873280 = Instance.new("BodyPartDescription")
            obj873280.Name = "BodyPartDescription"
            obj873280.Parent = obj571764
            local obj443658 = Instance.new("BodyPartDescription")
            obj443658.Name = "BodyPartDescription"
            obj443658.Parent = obj571764
            local obj964515 = Instance.new("BodyPartDescription")
            obj964515.Name = "BodyPartDescription"
            obj964515.Parent = obj571764
        local obj878915 = Instance.new("Animator")
        obj878915.Name = "Animator"
        obj878915.Parent = obj271128
    local obj447267 = Instance.new("Part")
    obj447267.Name = "HumanoidRootPart"
    obj447267.Size = Vector3.new(2, 2, 1)
    obj447267.Position = Vector3.new(9.396509170532227, 3, -46.2797737121582)
    obj447267.Anchored = true
    obj447267.BrickColor = BrickColor.new("Light grey metallic")
    obj447267.Parent = obj891987
        local obj878982 = Instance.new("Attachment")
        obj878982.Name = "RootAttachment"
        obj878982.Parent = obj447267
        local obj662605 = Instance.new("Motor6D")
        obj662605.Name = "RootJoint"
        obj662605.Parent = obj447267
local obj386695 = Instance.new("Folder")
obj386695.Name = "Scripts"
obj386695.Parent = game.ServerStorage
local obj672146 = Instance.new("Folder")
obj672146.Name = "ModelFolder"
obj672146.Parent = game.ServerStorage
    local obj880333 = Instance.new("Model")
    obj880333.Name = "fortnite"
    obj880333.Parent = obj672146
        local obj788620 = Instance.new("Part")
        obj788620.Name = "t"
        obj788620.Size = Vector3.new(2, 2, 1)
        obj788620.Position = Vector3.new(564.6911010742188, -459.1837158203125, 196.55831909179688)
        obj788620.Anchored = false
        obj788620.BrickColor = BrickColor.new("Medium stone grey")
        obj788620.Parent = obj880333
        local obj139278 = Instance.new("Model")
        obj139278.Name = "p"
        obj139278.Parent = obj880333
            local obj208057 = Instance.new("MeshPart")
            obj208057.Name = "d"
            obj208057.Size = Vector3.new(0.38539111614227295, 1.0480799674987793, 0.4050000011920929)
            obj208057.Position = Vector3.new(564.7144775390625, -460.1531066894531, 195.25851440429688)
            obj208057.Anchored = true
            obj208057.BrickColor = BrickColor.new("Institutional white")
            obj208057.Parent = obj139278
            local obj592320 = Instance.new("MeshPart")
            obj592320.Name = "d"
            obj592320.Size = Vector3.new(0.40520694851875305, 0.8823224902153015, 0.44999998807907104)
            obj592320.Position = Vector3.new(564.7216796875, -460.1669921875, 195.53451538085938)
            obj592320.Anchored = true
            obj592320.BrickColor = BrickColor.new("Institutional white")
            obj592320.Parent = obj139278
            local obj788883 = Instance.new("MeshPart")
            obj788883.Name = "d"
            obj788883.Size = Vector3.new(0.3333650827407837, 0.8773937821388245, 0.33512842655181885)
            obj788883.Position = Vector3.new(564.7224731445312, -460.0988464355469, 195.02804565429688)
            obj788883.Anchored = true
            obj788883.BrickColor = BrickColor.new("Institutional white")
            obj788883.Parent = obj139278
            local obj597748 = Instance.new("MeshPart")
            obj597748.Name = "d"
            obj597748.Size = Vector3.new(0.3960185945034027, 1.185361623764038, 0.2932211756706238)
            obj597748.Position = Vector3.new(564.69384765625, -460.12811279296875, 195.19772338867188)
            obj597748.Anchored = true
            obj597748.BrickColor = BrickColor.new("Institutional white")
            obj597748.Parent = obj139278
            local obj272746 = Instance.new("UnionOperation")
            obj272746.Name = "s"
            obj272746.Size = Vector3.new(1.5847364664077759, 0.3388955593109131, 0.39878109097480774)
            obj272746.Position = Vector3.new(564.706787109375, -460.1424560546875, 195.4532012939453)
            obj272746.Anchored = true
            obj272746.BrickColor = BrickColor.new("Light orange")
            obj272746.Parent = obj139278
            local obj388293 = Instance.new("UnionOperation")
            obj388293.Name = "s"
            obj388293.Size = Vector3.new(1.5117579698562622, 0.09470876306295395, 0.41644179821014404)
            obj388293.Position = Vector3.new(564.7063598632812, -460.1879577636719, 195.407958984375)
            obj388293.Anchored = true
            obj388293.BrickColor = BrickColor.new("Light orange")
            obj388293.Parent = obj139278
            local obj157223 = Instance.new("Part")
            obj157223.Name = "o"
            obj157223.Size = Vector3.new(0.06173836067318916, 0.06389614194631577, 0.061738383024930954)
            obj157223.Position = Vector3.new(564.6982421875, -460.0671081542969, 194.63275146484375)
            obj157223.Anchored = true
            obj157223.BrickColor = BrickColor.new("Really black")
            obj157223.Parent = obj139278
                local obj238570 = Instance.new("SpecialMesh")
                obj238570.Name = "Mesh"
                obj238570.Parent = obj157223
            local obj267216 = Instance.new("MeshPart")
            obj267216.Name = "p"
            obj267216.Size = Vector3.new(0.22200000286102295, 0.33399999141693115, 0.23000000417232513)
            obj267216.Position = Vector3.new(564.7024536132812, -460.0286560058594, 194.7771453857422)
            obj267216.Anchored = true
            obj267216.BrickColor = BrickColor.new("Salmon")
            obj267216.Parent = obj139278
                local obj931952 = Instance.new("Attachment")
                obj931952.Name = "hit"
                obj931952.Parent = obj267216
                    local obj468792 = Instance.new("ParticleEmitter")
                    obj468792.Name = "prt"
                    obj468792.Parent = obj931952
            local obj109426 = Instance.new("MeshPart")
            obj109426.Name = "s"
            obj109426.Size = Vector3.new(0.27053603529930115, 0.21953386068344116, 0.3124631941318512)
            obj109426.Position = Vector3.new(564.7086791992188, -460.05645751953125, 194.8513946533203)
            obj109426.Anchored = true
            obj109426.BrickColor = BrickColor.new("Light orange")
            obj109426.Parent = obj139278
    local obj364011 = Instance.new("Model")
    obj364011.Name = "fortnite2"
    obj364011.Parent = obj672146
        local obj212338 = Instance.new("Part")
        obj212338.Name = "t"
        obj212338.Size = Vector3.new(2, 2, 1)
        obj212338.Position = Vector3.new(564.6911010742188, -459.1837158203125, 196.55831909179688)
        obj212338.Anchored = false
        obj212338.BrickColor = BrickColor.new("Medium stone grey")
        obj212338.Parent = obj364011
        local obj736667 = Instance.new("Model")
        obj736667.Name = "s"
        obj736667.Parent = obj364011
            local obj567440 = Instance.new("UnionOperation")
            obj567440.Name = "s"
            obj567440.Size = Vector3.new(0.5120582580566406, 0.5299997329711914, 0.85239577293396)
            obj567440.Position = Vector3.new(564.5359497070312, -460.60357666015625, 196.09725952148438)
            obj567440.Anchored = true
            obj567440.BrickColor = BrickColor.new("Light orange")
            obj567440.Parent = obj736667
            local obj504822 = Instance.new("UnionOperation")
            obj504822.Name = "s"
            obj504822.Size = Vector3.new(0.5120582580566406, 0.5299997329711914, 0.85239577293396)
            obj504822.Position = Vector3.new(564.8834228515625, -460.61212158203125, 196.0951690673828)
            obj504822.Anchored = true
            obj504822.BrickColor = BrickColor.new("Light orange")
            obj504822.Parent = obj736667
            local obj709878 = Instance.new("Part")
            obj709878.Name = "s"
            obj709878.Size = Vector3.new(0.573355495929718, 0.11490507423877716, 0.7296811938285828)
            obj709878.Position = Vector3.new(564.710205078125, -460.4187316894531, 196.11244201660156)
            obj709878.Anchored = true
            obj709878.BrickColor = BrickColor.new("Light orange")
            obj709878.Parent = obj736667
                local obj425830 = Instance.new("SpecialMesh")
                obj425830.Name = "Mesh"
                obj425830.Parent = obj709878
            local obj802451 = Instance.new("Part")
            obj802451.Name = "s"
            obj802451.Size = Vector3.new(0.5006203651428223, 0.12623757123947144, 0.9219734072685242)
            obj802451.Position = Vector3.new(564.7138061523438, -460.4807434082031, 196.08616638183594)
            obj802451.Anchored = true
            obj802451.BrickColor = BrickColor.new("Light orange")
            obj802451.Parent = obj736667
                local obj372703 = Instance.new("SpecialMesh")
                obj372703.Name = "Mesh"
                obj372703.Parent = obj802451
            local obj850021 = Instance.new("Part")
            obj850021.Name = "s"
            obj850021.Size = Vector3.new(0.43821361660957336, 0.4966089129447937, 0.8100000023841858)
            obj850021.Position = Vector3.new(564.7092895507812, -460.3807373046875, 196.0914306640625)
            obj850021.Anchored = true
            obj850021.BrickColor = BrickColor.new("Light orange")
            obj850021.Parent = obj736667
                local obj806584 = Instance.new("SpecialMesh")
                obj806584.Name = "Mesh"
                obj806584.Parent = obj850021
    local obj683097 = Instance.new("Model")
    obj683097.Name = "a"
    obj683097.Parent = obj672146
        local obj603625 = Instance.new("Part")
        obj603625.Name = "[A] Areola"
        obj603625.Size = Vector3.new(0.44689351320266724, 0.4468937814235687, 0.751856803894043)
        obj603625.Position = Vector3.new(-1.5977094173431396, -0.7097090482711792, -27.518600463867188)
        obj603625.Anchored = false
        obj603625.BrickColor = BrickColor.new("Medium red")
        obj603625.Parent = obj683097
            local obj566500 = Instance.new("SpecialMesh")
            obj566500.Name = "Mesh"
            obj566500.Parent = obj603625
        local obj114080 = Instance.new("Part")
        obj114080.Name = "[B] Nipple"
        obj114080.Size = Vector3.new(0.19955195486545563, 0.19955219328403473, 0.13870301842689514)
        obj114080.Position = Vector3.new(-1.679534673690796, -0.6081324815750122, -27.835311889648438)
        obj114080.Anchored = false
        obj114080.BrickColor = BrickColor.new("Salmon")
        obj114080.Parent = obj683097
            local obj695295 = Instance.new("SpecialMesh")
            obj695295.Name = "Mesh"
            obj695295.Parent = obj114080
        local obj271196 = Instance.new("Part")
        obj271196.Name = "[A] Areola"
        obj271196.Size = Vector3.new(0.44689351320266724, 0.4468937814235687, 0.751856803894043)
        obj271196.Position = Vector3.new(-0.5462203025817871, -0.708915114402771, -27.51032257080078)
        obj271196.Anchored = false
        obj271196.BrickColor = BrickColor.new("Medium red")
        obj271196.Parent = obj683097
            local obj606428 = Instance.new("SpecialMesh")
            obj606428.Name = "Mesh"
            obj606428.Parent = obj271196
        local obj405634 = Instance.new("Part")
        obj405634.Name = "[B] Nipple"
        obj405634.Size = Vector3.new(0.19918978214263916, 0.19918978214263916, 0.13882923126220703)
        obj405634.Position = Vector3.new(-0.46369314193725586, -0.6073228120803833, -27.826866149902344)
        obj405634.Anchored = false
        obj405634.BrickColor = BrickColor.new("Salmon")
        obj405634.Parent = obj683097
            local obj911846 = Instance.new("SpecialMesh")
            obj911846.Name = "Mesh"
            obj911846.Parent = obj405634
        local obj882310 = Instance.new("MeshPart")
        obj882310.Name = "d"
        obj882310.Size = Vector3.new(0.9453778266906738, 1.194388747215271, 0.9558831453323364)
        obj882310.Position = Vector3.new(-0.6499419808387756, -0.6045199632644653, -27.427947998046875)
        obj882310.Anchored = false
        obj882310.BrickColor = BrickColor.new("Institutional white")
        obj882310.Parent = obj683097
        local obj365671 = Instance.new("MeshPart")
        obj365671.Name = "d"
        obj365671.Size = Vector3.new(0.7064736485481262, 1.1351135969161987, 0.766349196434021)
        obj365671.Position = Vector3.new(-1.5816800594329834, -0.6054273843765259, -27.52801513671875)
        obj365671.Anchored = false
        obj365671.BrickColor = BrickColor.new("Institutional white")
        obj365671.Parent = obj683097
        local obj871244 = Instance.new("Part")
        obj871244.Name = "Torso"
        obj871244.Size = Vector3.new(2, 2, 1)
        obj871244.Position = Vector3.new(-1.0839653015136719, -0.8797364234924316, -26.611595153808594)
        obj871244.Anchored = false
        obj871244.BrickColor = BrickColor.new("Fossil")
        obj871244.Parent = obj683097
            local obj462081 = Instance.new("Motor6D")
            obj462081.Name = "rbw"
            obj462081.Parent = obj871244
            local obj510314 = Instance.new("Motor6D")
            obj510314.Name = "lbw"
            obj510314.Parent = obj871244
        local obj784020 = Instance.new("Part")
        obj784020.Name = "RightBreast"
        obj784020.Size = Vector3.new(1, 1, 1)
        obj784020.Position = Vector3.new(-0.6339659690856934, -0.3797309398651123, -27.111595153808594)
        obj784020.Anchored = false
        obj784020.BrickColor = BrickColor.new("Fossil")
        obj784020.Parent = obj683097
            local obj614424 = Instance.new("WeldConstraint")
            obj614424.Name = "WeldConstraint"
            obj614424.Parent = obj784020
            local obj686308 = Instance.new("WeldConstraint")
            obj686308.Name = "WeldConstraint"
            obj686308.Parent = obj784020
            local obj370721 = Instance.new("WeldConstraint")
            obj370721.Name = "WeldConstraint"
            obj370721.Parent = obj784020
            local obj184063 = Instance.new("WeldConstraint")
            obj184063.Name = "WeldConstraint"
            obj184063.Parent = obj784020
            local obj925832 = Instance.new("SpecialMesh")
            obj925832.Name = "Mesh"
            obj925832.Parent = obj784020
            local obj598764 = Instance.new("WeldConstraint")
            obj598764.Name = "WeldConstraint"
            obj598764.Parent = obj784020
        local obj445623 = Instance.new("Part")
        obj445623.Name = "LeftBreast"
        obj445623.Size = Vector3.new(1, 1, 1)
        obj445623.Position = Vector3.new(-1.5339648723602295, -0.3797338008880615, -27.111595153808594)
        obj445623.Anchored = false
        obj445623.BrickColor = BrickColor.new("Fossil")
        obj445623.Parent = obj683097
            local obj759984 = Instance.new("WeldConstraint")
            obj759984.Name = "WeldConstraint"
            obj759984.Parent = obj445623
            local obj164877 = Instance.new("WeldConstraint")
            obj164877.Name = "WeldConstraint"
            obj164877.Parent = obj445623
            local obj588076 = Instance.new("WeldConstraint")
            obj588076.Name = "WeldConstraint"
            obj588076.Parent = obj445623
            local obj220541 = Instance.new("WeldConstraint")
            obj220541.Name = "WeldConstraint"
            obj220541.Parent = obj445623
            local obj417193 = Instance.new("SpecialMesh")
            obj417193.Name = "Mesh"
            obj417193.Parent = obj445623
            local obj161540 = Instance.new("WeldConstraint")
            obj161540.Name = "WeldConstraint"
            obj161540.Parent = obj445623
        local obj256407 = Instance.new("MeshPart")
        obj256407.Name = "s"
        obj256407.Size = Vector3.new(1.1080000400543213, 1.2920000553131104, 1.1100000143051147)
        obj256407.Position = Vector3.new(-1.5309598445892334, -0.6957420110702515, -27.224586486816406)
        obj256407.Anchored = false
        obj256407.BrickColor = BrickColor.new("Dark taupe")
        obj256407.Parent = obj683097
        local obj891228 = Instance.new("MeshPart")
        obj891228.Name = "s"
        obj891228.Size = Vector3.new(1.1080000400543213, 1.2920000553131104, 1.1100000143051147)
        obj891228.Position = Vector3.new(-0.6359648704528809, -0.6957396268844604, -27.22258758544922)
        obj891228.Anchored = false
        obj891228.BrickColor = BrickColor.new("Dark taupe")
        obj891228.Parent = obj683097
    local obj560915 = Instance.new("Model")
    obj560915.Name = "f"
    obj560915.Parent = obj672146
        local obj270690 = Instance.new("Humanoid")
        obj270690.Name = "Humanoid"
        obj270690.Parent = obj560915
            local obj368308 = Instance.new("Animator")
            obj368308.Name = "Animator"
            obj368308.Parent = obj270690
            local obj484622 = Instance.new("HumanoidDescription")
            obj484622.Name = "HumanoidDescription"
            obj484622.Parent = obj270690
                local obj347896 = Instance.new("AccessoryDescription")
                obj347896.Name = "AccessoryDescription"
                obj347896.Parent = obj484622
                local obj728103 = Instance.new("AccessoryDescription")
                obj728103.Name = "AccessoryDescription"
                obj728103.Parent = obj484622
                local obj764043 = Instance.new("AccessoryDescription")
                obj764043.Name = "AccessoryDescription"
                obj764043.Parent = obj484622
                local obj596498 = Instance.new("BodyPartDescription")
                obj596498.Name = "BodyPartDescription"
                obj596498.Parent = obj484622
                local obj126603 = Instance.new("BodyPartDescription")
                obj126603.Name = "BodyPartDescription"
                obj126603.Parent = obj484622
                local obj549114 = Instance.new("BodyPartDescription")
                obj549114.Name = "BodyPartDescription"
                obj549114.Parent = obj484622
                local obj902819 = Instance.new("AccessoryDescription")
                obj902819.Name = "AccessoryDescription"
                obj902819.Parent = obj484622
                local obj857311 = Instance.new("AccessoryDescription")
                obj857311.Name = "AccessoryDescription"
                obj857311.Parent = obj484622
                local obj264215 = Instance.new("BodyPartDescription")
                obj264215.Name = "BodyPartDescription"
                obj264215.Parent = obj484622
                local obj711542 = Instance.new("BodyPartDescription")
                obj711542.Name = "BodyPartDescription"
                obj711542.Parent = obj484622
                local obj289602 = Instance.new("BodyPartDescription")
                obj289602.Name = "BodyPartDescription"
                obj289602.Parent = obj484622
                local obj864285 = Instance.new("AccessoryDescription")
                obj864285.Name = "AccessoryDescription"
                obj864285.Parent = obj484622
        local obj885521 = Instance.new("Part")
        obj885521.Name = "HumanoidRootPart"
        obj885521.Size = Vector3.new(2, 2, 1)
        obj885521.Position = Vector3.new(-1.1481819152832031, -362.6871337890625, 301.2574768066406)
        obj885521.Anchored = false
        obj885521.BrickColor = BrickColor.new("Medium stone grey")
        obj885521.Parent = obj560915
            local obj290127 = Instance.new("Attachment")
            obj290127.Name = "RootAttachment"
            obj290127.Parent = obj885521
            local obj899852 = Instance.new("Motor6D")
            obj899852.Name = "RootJoint"
            obj899852.Parent = obj885521
        local obj385393 = Instance.new("Part")
        obj385393.Name = "Right Leg"
        obj385393.Size = Vector3.new(1, 2, 1)
        obj385393.Position = Vector3.new(-0.6481819152832031, -364.6871337890625, 301.2574768066406)
        obj385393.Anchored = false
        obj385393.BrickColor = BrickColor.new("Institutional white")
        obj385393.Parent = obj560915
            local obj432158 = Instance.new("Attachment")
            obj432158.Name = "RightFootAttachment"
            obj432158.Parent = obj385393
        local obj989241 = Instance.new("BodyColors")
        obj989241.Name = "Body Colors"
        obj989241.Parent = obj560915
        local obj258169 = Instance.new("Part")
        obj258169.Name = "Head"
        obj258169.Size = Vector3.new(2, 1, 1)
        obj258169.Position = Vector3.new(-1.1481819152832031, -361.1871337890625, 301.2574768066406)
        obj258169.Anchored = false
        obj258169.BrickColor = BrickColor.new("Institutional white")
        obj258169.Parent = obj560915
            local obj933452 = Instance.new("Attachment")
            obj933452.Name = "HairAttachment"
            obj933452.Parent = obj258169